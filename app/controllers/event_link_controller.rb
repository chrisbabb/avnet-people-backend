class EventLinkController < ApplicationController

    def create
        event_link = EventLink.create!(legal_params)
    
        if person.save
          render json: event_link, status: :created
        else
          render json: {valid: "false", errorMessages: event_link.errors.messages}
        end
    end

    def update
        event_link = EventLink.find(params[:id])

        if event_link.update(legal_params)
            render json: event_link, status: :accepted
        else
            render json: {valid: "false", errorMessages: event_link.errors.messages}
        end
    end

    private

    def legal_params
        params.permit(:event_id, :person_id)
    end

end
