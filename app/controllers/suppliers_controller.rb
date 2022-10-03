class SuppliersController < ApplicationController
  
  def index
    @suppliers = Supplier.all
  end

  def show
    @supplier = Supplier.find(params[:id])
  end

  def new
    @supplier = Supplier.new
  end

  def create
    @supplier = Supplier.new(supplier_params)
    if @supplier.save
      redirect_to @supplier, notice: 'Fornecedor cadastrado com sucesso.'
    else
      flash.now[:alert] = 'Fornecedor não cadastrado.'
      render 'new'
    end
  end

  def edit
    @supplier = Supplier.find(params[:id])
  end

  def update
    @supplier = Supplier.find(params[:id])
    if @supplier.update(supplier_params)
    end
  end

  def supplier_params
    params.require(:supplier).permit(:corporate_name, :registration_number, :full_address, :brand_name, :city, :state, :email)
  end
end