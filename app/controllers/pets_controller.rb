class PetsController < ApplicationController
  before_action :find_pet, only: [:show, :edit, :update, :destroy]


  def index
    @pets = Pet.all.order(:name)
  end

  def new
    @pet = current_user.pets.build
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to pets_path, notice: 'Pet created successfully'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @pet.update(pet_params)
      redirect_to @pet, notice: 'Pet updated successfully'
    else
      render :edit
    end
  end

  def destroy
    @pet.destroy
    redirect_to pets_path, notice: 'Pet successfully deleted'
  end

  private

    def find_pet
      @pet = Pet.find(params[:id])
    end

    def pet_params
      params.require(:pet).permit(:name, :user_id)
    end

end
