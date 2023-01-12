class CorpEventsController < ApplicationController
  def index
    render json: CorpEvent.all
  end

  def show
    render json: CorpEvent.find(params[:id])
  end

  def create
    corp_event = CorpEvent.new(legal_params)

    if corp_event.save
      render json: corp_event, status: :created
    else
      render json: {valid: "false", errorMessages: corp_event.errors.messages}
    end
  end

  def update
    corp_event = CorpEvent.find(params[:id])

    if corp_event.update(legal_params)
      render json: corp_event, status: :accepted
    else
      render json: {valid: "false", errorMessages: corp_event.errors.messages}
    end
  end

  def destroy
    corp_event = CorpEvent.find(params[:id])

    eventss.destroy
  end

  private

  def legal_params
    params.require(:corp_event).permit(:name, :date)
  end

end