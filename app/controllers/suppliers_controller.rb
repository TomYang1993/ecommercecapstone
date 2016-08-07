class SuppliersController < ApplicationController
  def index
    @supplier = Supplier.all
  end

  def new
    render "new.html.erb"
  end

  def create
    supplier = Supplier.new(
      name: params[:name],
      email: params[:email],
      phone: params[:phone]
    )
    supplier.save
    redirect_to "/suppliers/#{supplier.id}"
  end

  def show
    @supplier = Supplier.find_by(id: params[:id])
  end

end
