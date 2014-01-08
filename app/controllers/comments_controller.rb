class CommentsController < ApplicationController

	def index
    comment = Comment.all
    comment.save
	end

 	def show
 		@comments = Comment.find(params[:post])
  end

  def new
  	@comments = Comment.new
  end

  def edit
  	@comments = Comment.find(params[:post])
  end

   def create
    @comment = Comment.new(params[:post])
    @post.comment = comment
   end

end
