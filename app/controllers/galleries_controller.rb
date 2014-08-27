class GalleriesController < ApplicationController
  def index
    @galleries = Gallery.all
    @items = Item.all
  end

  def create
    gallery = Gallery.create(gallery_params)
    if gallery.valid?
      render json: { status: 200, id: gallery.id, html: render_to_string(partial: "galleries/row", locals: { gallery: gallery }, layout: false) }
    else
      render json: { status: 400, message: gallery.errors.full_messages.join(", ")  }
    end
  end

  def edit
    gallery = Gallery.find_by(id: params[:id])
    @items = Item.all
    render json: { status: 200, html: render_to_string(partial: "galleries/edit", locals: { gallery: gallery }, layout: false) }
  end

  def update
    gallery = Gallery.find_by(id: params[:id])
    if gallery.update_attributes(gallery_params)
      render json: { status: 200, id: gallery.id, html: render_to_string(partial: "galleries/row", locals: { gallery: gallery }, layout: false) }
    else
      render json: { status: 400, message: gallery.errors.full_messages.join(", ")  }
    end
  end

  def destroy
    gallery = Gallery.find_by(id: params[:id])
    gallery.destroy
    render json: { status: 200 }
  end

  private
  def gallery_params
    params.require(:gallery).permit(:name, :description, :primary_item_id)
  end
end
