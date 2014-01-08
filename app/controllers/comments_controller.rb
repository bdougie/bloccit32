class CommentsController < ApplicationController

	def create
    @topic = Topic.find(params[:topic_id]) # added after I saw the answer
    @post = @topic.posts.find(params[:post_id]) # added after I saw the answer
    @comments = @post.comments 

    @comment = current_user.comments.build(params[:comment]) #I did not know to add
    @comment.post = @post
   
    authorize! :create, @comment, message: "You need be signed in to do that."
    if @comment.save
      flash[:notice] = "Comment saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the comment. Please try again."
      render 'posts/show'
    end
  end
 end


   


