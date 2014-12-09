class Logbook::EngagementsController < Logbook::ApplicationController
  before_action :set_engagement, only: [:show, :edit, :update, :destroy, :duplicate, :toggle_dream_team]

  # GET /engagements
  # GET /engagements.json
  def index
    params[:sort] ||= 'date DESC'
    @engagements = current_scope.engagements.filter(filter_params).page(params[:page])
    @engagement = current_scope.engagements.new
  end

  # GET /engagements/1
  # GET /engagements/1.json
  def show
  end

  # GET /engagements/new
  def new
    @engagement = Engagement.new
  end

  # GET /engagements/1/edit
  def edit
  end

  def duplicate
    @clone = @engagement.dup
    @clone.date = Date.today
    if @clone.save
      redirect_to edit_logbook_engagement_path(@clone), notice: "Engagement was successfully duplicated."
    else
      redirect_to logbook_engagement_path(@engagement), notice: "Engagement was NOT duplicated."
    end
  end

  def toggle_dream_team
    if @engagement.attendees.where(dream_team: true).any?
      @ids = @engagement.attendees.where('dream_team != ?', true).pluck(:id)
    else
      @ids = (current_scope.dream_team.pluck(:id) + @engagement.attendee_ids).flatten.uniq
    end
    respond_to do |format|
      if @engagement.update_attributes(attendee_ids: @ids)
        format.html { redirect_to edit_logbook_engagement_path(@engagement), notice: 'Dream Team toggled!' }
        format.js
      else
        render status: :unprocessible_entity
      end
    end
  end

  # POST /engagements
  # POST /engagements.json
  def create
    @engagement = Engagement.new(engagement_params)

    respond_to do |format|
      if @engagement.save
        format.html { redirect_to edit_logbook_engagement_path(@engagement), notice: 'Engagement was successfully created.' }
        format.json { render :show, status: :created, location: @engagement }
      else
        format.html { redirect_to logbook_engagements_path, notice: 'Engagement was not created.' }
        format.json { render json: @engagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /engagements/1
  # PATCH/PUT /engagements/1.json
  def update
    respond_to do |format|
      if @engagement.update(engagement_params)
        format.html { redirect_to [:logbook, @engagement], notice: 'Engagement was successfully updated.' }
        format.json { render :show, status: :ok, location: @engagement }
      else
        format.html { render :edit }
        format.json { render json: @engagement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /engagements/1
  # DELETE /engagements/1.json
  def destroy
    @engagement.destroy
    respond_to do |format|
      format.html { redirect_to logbook_engagements_url, notice: 'Engagement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_engagement
      @engagement = Engagement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def engagement_params
      params.require(:engagement).permit(
        :kind,
        :date,
        :school_id,
        :name,
        :notes,
        :duration,
        attendee_ids: []
      )
    end

    def filter_params
      params.slice(:q, :sort)
    end
end
