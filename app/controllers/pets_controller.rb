class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    pet = Pet.update(params[:id], pet_params)

    redirect_to action: :show, id: pet.id
  end

  def destroy
    Pet.destroy(params[:id])

    redirect_to '/pets'
  end

  private

  def pet_params
    params.permit(:image, :name, :description, :age, :sex)
  end
end
