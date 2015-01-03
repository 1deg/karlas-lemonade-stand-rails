class LemonadeTypesController < ApplicationController

  before_action :load_lemonade_type, except: [:index, :create, :new]

  def index
    @lemonade_types = LemonadeType.all
  end

  def new
  end

  def create
    @lemonade_type = LemonadeType.new(lemonade_type_params)
    if @lemonade_type.save
      redirect_to lemonade_types_path, notice: 'Lemonade type created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @lemonade_type.update(lemonade_type_params)
      redirect_to lemonade_types_path, notice: 'Lemonade type updated.'
    else
      render :edit
    end
  end

  def destroy
    purchases_using_this_type = Purchase.where(lemonade_type: @lemonade_type)
    if purchases_using_this_type.count > 0
      redirect_to lemonade_types_path, alert: "You can't delete a lemonade type that has been purchased."
    else
      @lemonade_type.destroy
      redirect_to lemonade_types_path, notice: "Lemonade type deleted."
    end
  end

  private

  def load_lemonade_type
    @lemonade_type = LemonadeType.find(params[:id])
  end

  def lemonade_type_params
    params.require(:lemonade_type).permit(:label, :price, :color)
  end

end
