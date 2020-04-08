class PropertiesController < ApplicationController
  def index
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    if @property.save
      redirect_to properties_path, notice: "物件を登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note)
  end
end
