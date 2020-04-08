class PropertiesController < ApplicationController
  def index
    @properties = Property.all.order(created_at: :DESC)
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
    @property = Property.find(params[:id])
  end

  def edit
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note)
  end
end
