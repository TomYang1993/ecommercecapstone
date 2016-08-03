class ProductsController < ApplicationController
  def index
    @product = Product.all
  end

  def new

  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    product.save
    redirect_to "/products/#{product.id}"
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    redirect_to "/products/#{@product.id}"
  end

  def destroy
    product = Product.find_by(id: params[:id])
    if product.destroy
      flash[:success] = "Product is successfully destroyed!"
      redirect_to '/products'
    else
      flash[:danger] = "delete failed!"
    end
  end

  def search
    @product = Product.where("name LIKE ?", "%#{params[:search_items]}%")
    render "index.html.erb"
  end
end
