class CommentsController < ApplicationController

	def create
    @topic = Topic.find(params[:topic_id]) # added after I saw the answer
    @post = @topic.posts.find(params[:post_id]) # added after I saw the answer
    @comments = @post.comments 

    @comment = current_user.comments.build(params[:comment]) #I did not know to add
    @comment.post = @post
    @new_comment = Comment.new
   
    authorize! :create, @comment, message: "You need be signed in to do that."
    if @comment.save
      flash[:notice] = "Comment saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render 'posts/show'
    end
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])

    @comment = @post.comments.find(params[:id])

    authorize! :destroy, @comment, message: "You need to own the comment to delete it."
    if @comment.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment couldn't be deleted. Try again."
      redirect_to [@topic, @post]
    end
  end
  
 end


   


