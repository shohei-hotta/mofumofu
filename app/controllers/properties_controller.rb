class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all.order(created_at: :DESC)
  end

  def new
    @property = Property.new
    2.times { @property.near_stations.build }
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

  def destroy
    @property.destroy
    redirect_to properties_path, notice: "物件情報を削除しました。"
  end

  private

  def property_params
    params.require(:property).permit(:name, :rent, :address, :age, :note,
                                     near_stations_attributes: [:id, :route, :name, :minute])
  end

  def set_property
    @property = Property.find(params[:id])
  end
end
