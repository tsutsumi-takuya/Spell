class SpotsController < ApplicationController
  def index
    @spots = Spot.all
    @user = current_user.id
    @search_spots = Spot.all.search(params[:seach])
  end

  def show
    @spot = Spot.find(params[:id])
    @user = User.find(current_user.id)
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user_id = current_user.id

    if
      @spot.save
      redirect_to spot_path(@spot.id)

    else
      @spots = Spot.all
      @user =  current_user.id
      render action: :new
    end
  end

  def edit
    @spot = Spot.find(params[:id])

    if
      @spot.user_id = current_user.id
      render action: :edit

    else
      redirect_to spots_path
    end
  end

  def update
    @spot = Spot.find(params[:id])
    @spot.update(spot_params)

    if
      @spot.save
      redirect_to spot_path(@spot.id)

    else
      @user = current_user
      @spots = Spot.all
      reder action: :edit
    end
  end

  def destroy
    spot = Spot.find(params[:id])
    spot.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def spot_params
    params.require(:spot).permit(:spot_name, :caption, :address, :spot_image)
  end
end
