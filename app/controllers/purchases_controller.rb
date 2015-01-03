class PurchasesController < ApplicationController

  before_action :load_purchase, only: [:destroy]

  def index
    @purchases = Purchase.all.order('created_at DESC')
  end

  def new
  end

  def create
    @purchase = Purchase.new(purchases_params)
    if @purchase.save
      redirect_to purchases_path, notice: 'Purchase recorded!'
    else
      render :new
    end
  end

  def destroy
    @purchase.destroy
    redirect_to purchases_path, notice: 'Purchase deleted'
  end

  private

  def load_purchase
    @purchase = Purchase.find(params[:id])
  end

  def purchases_params
    params.require(:purchase).permit(:quantity, :lemonade_type_id)
  end

end
