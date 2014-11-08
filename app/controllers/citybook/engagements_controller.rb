class Citybook::EngagementsController < Citybook::ApplicationController

  def index
    @engagements = current_scope.engagements.order('date DESC').page(params[:page])
    @engagement = Engagement.new(
      date: Date.today,
      school_id: current_user.school_id,
      kind: 'Event'
    )
  end

  def attendance
    @engagement = Engagement.find params[:id]
    @page_classes = 'hide-chrome'
    @js_data[:engagement_id] = @engagement.id
  end

  def create
    @engagement = Engagement.new(engagement_params)
    if @engagement.save
      respond_to do |format|
        format.html { redirect_to citybook_engagements_path, notice: 'Engagement added!' }
        format.js
      end
    else
      render json: @engagement.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @engagement = Engagement.find(params[:id])
    if @engagement.destroy
      redirect_to citybook_engagements_path, notice: 'Engagement deleted!'
    else
      render json: @engagement.errors, status: :unprocessable_entity
    end
  end

  private
    def engagement_params
      params[:engagement].permit!
    end

end
