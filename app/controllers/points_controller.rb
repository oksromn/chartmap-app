class PointsController < ApplicationController
  before_action :find_chart, only: [:index, :create]

  def index
    respond_to do |format|
      format.json { render json: @chart.points.map { |point| [point.date, point.value] } }
    end
  end

  def create
    @point = @chart.points.new(point_params)

    respond_to do |format|
      if @point.save
        format.html { redirect_to chart_path(@chart), notice: t(".success") }
        # format.json { render :show, status: :created, location: @chart }
      else
        format.html {
          # flash[:alert] = @point.errors.full_messages.to_sentence
          redirect_to chart_path(@chart), alert: @point.errors.full_messages.to_sentence
        }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  private

  def point_params
    params.require(:point).permit(:value, :description, :date)
  end

  def find_point
    @point = Point.find(params[:id])
  end

  def find_chart
    @chart = Chart.find(params[:chart_id])
  end
end
