class CommentsController < ApplicationController

	def create
    comment = Comment.new(comments_params)
    comment.save
	end


end
