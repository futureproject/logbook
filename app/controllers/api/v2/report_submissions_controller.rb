class Api::V2::ReportSubmissionsController < Api::V2::BaseController
  before_action :set_report_submission, only: [:show, :edit, :update, :destroy]

  # GET /api/v2/report_submissions
  # GET /api/v2/report_submissions.json
  def index
    @report_submissions = current_user.report_submissions
      .order(sort_params)
      .page(params[:page])
    @total = @report_submissions.total_count
  end

  # GET /api/v2/report_submissions/1
  def show
  end

  # GET /api/v2/report_submissions/new
  def new
    @report_submission = ReportSubmission.new
  end

  # GET /api/v2/report_submissions/1/edit
  def edit
  end

  # POST /api/v2/report_submissions
  def create
    @report_submission = ReportSubmission.new(report_submission_params)
    if @report_submission.save
      render :show, status: :created, location: api_v2_report_submission_url(@report_submission)
    else
      render json: @report_submission.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v2/report_submissions/1
  def update
    if @report_submission.update(report_submission_params)
      render :show, status: :ok, location: api_v2_report_submission_url(@report_submission)
    else
      render json: @report_submission.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v2/report_submissions/1
  def destroy
    @report_submission.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_submission
      @report_submission = ReportSubmission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_submission_params
      params.require(:report_submission).permit(
        :name,
        :body,
        :status,
        :user_id,
      )
    end

    def sort_params
      if params[:sort_by] && params[:order]
        "#{params[:sort_by]} #{params[:order]}"
      else
        "created_at DESC"
      end
    end
end
