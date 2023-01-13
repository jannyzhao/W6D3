class CommentsController < ApplicationController
    def index
        comments = Comment.where(artwork_id: params[:artwork_id]).or(Comment.where(author_id: params[:user_id]))
        render json: comments
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to comment_url(comment)
    end

    private
    def comment_params
        params.require(:comment).permit(:author_id, :artwork_id, :body)
    end
end
