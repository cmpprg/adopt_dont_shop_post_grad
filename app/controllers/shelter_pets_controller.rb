class ShelterPetsController < ApplicationController
  def index
    @shelter_pets = Shelter.find(params[:id]).pets
  end
end
