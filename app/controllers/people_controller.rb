class PeopleController < ApplicationController
  def index
    people = Person.all

    formatted_people = people.map { |person| PeopleSerializer.new(person).serializable_hash[:data] }

    render json: formatted_people
  end

  def show
    person = Person.find(params[:id])
    render json: PeopleSerializer.new(person).serializable_hash[:data][:attributes]
  end

  def create
    person = Person.new(legal_params)

    if person.save
      render json: person, status: :created
    else
      render json: {valid: "false", errorMessages: person.errors.messages}
    end
  end

  def update
    person = Person.find(params[:id])

    if person.update(legal_params)
      render json: person, status: :accepted
    else
      render json: {valid: "false", errorMessages: person.errors.messages}
    end
  end

  def destroy
    person = Person.find(params[:id])

    person.destroy
  end

  private

  def legal_params
    params.require(:person).permit(:firstname, :lastname, :title, :sex, :notes, :company, :image)
  end

end
