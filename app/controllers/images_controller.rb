class ImagesController < ApplicationController
  def new
    render "new.html.erb"
  end

  def create
    image = Image.new(
      link: params[:link],
      product_id: params[:product][:product_id]
    )
    if image.save
      flash[:success] = "Your image has been created!"
      redirect_to '/images/new'
    else
      flash[:danger] = "Unknown mistake!"
    end
  end
end
