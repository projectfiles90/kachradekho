class CommentsController < ApplicationController
  before_action :set_product, only: [:create]
  before_action :authorize_request, only: [:create]

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = @current_user

    if @comment.save
      render json: { comment: @comment, message: 'Comment was successfully created.' }, status: :created
    else
      render json: { error: @comment.errors.full_messages.join(',') }, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
