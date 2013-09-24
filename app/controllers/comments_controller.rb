class CommentsController < ApplicationController
  before_action :load_commentable

  def index
    # refactored to before_action
    # @commentable = Product.find(params[:product_id])
    
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new(comment_params)
    if @comment.save
      redirect_to [@commentable, :comments], notice: "Comment created."
      
      # to for example /photo/2 (to corrent object)
      # redirect_to @commentable, notice: "Comment created."
    else
      render :new
    end
  end

private

  # with standart URL format
  def load_commentable
    resource, id = request.path.split('/')[1,2] # split by slash and grab 1st and 2nd element in array
    # products/1
    @commentable = resource.singularize.classify.constantize.find(id)
    # converted to Product.find(1)
  end

  # more specific technique
  # def load_commentable
  #   klass = [Product, Category].detect { |c| params["#{c.name.underscore}_id"]}
  #   @commentable = klass.find(params["#{klass.name.underscore}_id"])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:content)
  end
 
end
