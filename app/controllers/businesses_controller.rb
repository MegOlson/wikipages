class BusinessesController < ApplicationController

  def new
    @type = Type.find(params[:type_id])
    @business = @type.businesses.new
  end

  def show
    @business = Business.find(params[:id])
  end

  def create
    @type = Type.find(params[:type_id])
    @business = @type.businesses.new(business_params)
    if @business.save
      redirect_to type_path(@type)
    else
      render :new
    end
  end

  def update
    @type = Type.find(params[:type_id])
    @business = Business.find(params[:id])
    if @business.update(business_params)
      redirect_to type_path(@type)
    else
      render :edit
    end
  end

  def edit
    @type = Type.find(params[:type_id])
    @business = Business.find(params[:id])
  end

  def destroy
    @type = Type.find(params[:type_id])
    @business = Business.find(params[:id])
    @business.destroy
    redirect_to type_path(@type)
  end

private

  def business_params
    params.require(:business).permit(:name, :address, :phone_number, :website, :open_at, :closed_at)
  end

end
