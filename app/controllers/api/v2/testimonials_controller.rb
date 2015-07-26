class Api::V2::TestimonialsController < Api::V2::BaseController
  before_action :set_testimonial, only: [:show, :edit, :update, :destroy]

  # GET /api/v2/testimonials
  # GET /api/v2/testimonials.json
  def index
    @testimonials = current_user.testimonials.order('id DESC')
  end

  # GET /api/v2/testimonials/1
  # GET /api/v2/testimonials/1.json
  def show
  end

  # GET /api/v2/testimonials/new
  def new
    @testimonial = Testimonial.new
  end

  # GET /api/v2/testimonials/1/edit
  def edit
  end

  # POST /api/v2/testimonials
  # POST /api/v2/testimonials.json
  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.save
      render :show, status: :created, location: api_v2_testimonial_url(@testimonial)
    else
      render json: @testimonial.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/testimonials/1
  # PATCH/PUT /api/v2/testimonials/1.json
  def update
    if @testimonial.update(testimonial_params)
      render :show, status: :ok, location: api_v2_testimonial_url(@testimonial)
    else
      render json: @testimonial.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/testimonials/1
  # DELETE /api/v2/testimonials/1.json
  def destroy
    @testimonial.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testimonial
      @testimonial = current_user.testimonials.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testimonial_params
      params.require(:testimonial).permit(
        :content,
        :source,
        :person_id
      )
    end
end
