class CommentsController < ApplicationController
    def create
        @blogpost = Blogpost.find(params[:blogpost_id])
        @comment = @blogpost.comments.create(params[:comment].permit(:name, :body, :email))
        if @comment
            redirect_to blogpost_path(@blogpost)
        else
            render :create, status: :unprocessable_entity
        end
    end

    def destroy
        @blogpost = Blogpost.find(params[:blogpost_id])
        @comment = @blogpost.comments.find(params[:id])
        @comment.destroy
        redirect_to blogpost_path(@blogpost)
    end
end
