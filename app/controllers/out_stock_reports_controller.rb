class OutStockReportsController < ApplicationController
  before_action :set_out_stock_report, only: [:show, :update, :destroy]

  # GET /out_stock_reports
  def index
    @out_stock_reports = OutStockReport.all

    render json: @out_stock_reports
  end

  # GET /out_stock_reports/1
  def show
    render json: @out_stock_report
  end

  # POST /out_stock_reports
  def create
    @out_stock_report = OutStockReport.new(out_stock_report_params)

    if @out_stock_report.save
      render json: @out_stock_report, status: :created, location: @out_stock_report
    else
      render json: @out_stock_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /out_stock_reports/1
  def update
    if @out_stock_report.update(out_stock_report_params)
      render json: @out_stock_report
    else
      render json: @out_stock_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /out_stock_reports/1
  def destroy
    @out_stock_report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_out_stock_report
      @out_stock_report = OutStockReport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def out_stock_report_params
      params.require(:out_stock_report).permit(:order_id)
    end
end
