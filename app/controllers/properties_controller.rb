class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update]

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
  end

  def edit
  end

  def update
    if @property.update(property_params)
      redirect_to properties_path, notice: "物件情報を編集しました。"
    else
      render :edit
    end
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note)
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
