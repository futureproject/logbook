class Api::V1::ReportsController < Api::V1::BaseController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /api/v1/reports
  # GET /api/v1/reports.json
  def index
    @reports = current_user.reports.order('id DESC')
  end

  # GET /api/v1/reports/1
  # GET /api/v1/reports/1.json
  def show
  end

  # GET /api/v1/reports/new
  def new
    @report = Report.new
  end

  # GET /api/v1/reports/1/edit
  def edit
  end

  # POST /api/v1/reports
  # POST /api/v1/reports.json
  def create
    @report = Report.new(report_params)
    if @report.save
      render :show, status: :created, location: api_v1_report_url(@report)
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/reports/1
  # PATCH/PUT /api/v1/reports/1.json
  def update
    if @report.update(report_params)
      render :show, status: :ok, location: api_v1_report_url(@report)
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/reports/1
  # DELETE /api/v1/reports/1.json
  def destroy
    @report.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = current_user.reports.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(
        :content,
        :person_id
      )
    end
end
