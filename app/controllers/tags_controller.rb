class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    tag = Tag.create(tag_params)
    if tag.valid?
      render json: { status: 200, id: tag.id, html: render_to_string(partial: "tags/row", locals: { tag: tag }, layout: false) }
    else
      render json: { status: 400, message: tag.errors.full_messages.join(", ")  }
    end
  end

  def edit
    tag = Tag.find_by(id: params[:id])
    @items = Item.all
    render json: { status: 200, html: render_to_string(partial: "tags/edit", locals: { tag: tag }, layout: false) }
  end

  def update
    tag = Tag.find_by(id: params[:id])
    if tag.update_attributes(tag_params)
      render json: { status: 200, id: tag.id, html: render_to_string(partial: "tags/row", locals: { tag: tag }, layout: false) }
    else
      render json: { status: 400, message: tag.errors.full_messages.join(", ")  }
    end
  end

  def destroy
    tag = Tag.find_by(id: params[:id])
    tag.destroy
    render json: { status: 200 }
  end

  private
  def tag_params
    params.require(:tag).permit(:name)
  end
end
