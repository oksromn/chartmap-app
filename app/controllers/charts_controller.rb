class ChartsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_chart, only: [:edit, :show, :update]

  def index
    @charts = current_user.charts
  end

  def new
    @chart = current_user.charts.new
  end

  def edit; end

  def create
    @chart = current_user.charts.new(chart_params)

    respond_to do |format|
      if @chart.save
        format.html { redirect_to chart_path(@chart), notice: t(".success") }
        format.json { render :show, status: :created, location: @chart }
      else
        format.html {
          flash[:alert] = @chart.errors.full_messages.to_sentence
          render :new
        }
        format.json { render json: @chart.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def update; end

  private

  def chart_params
    params.require(:chart).permit(:title, :chart_type)
  end

  def find_chart
    @chart = current_user.charts.find(params[:id])
  end
end
