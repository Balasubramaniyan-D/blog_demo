class BlogpostsController < ApplicationController
    before_action :correct_user, only: [:edit, :update, :destroy]

    def index
        @category = params[:category]
        if @category
            @blogpost = Blogpost.where(category: "#{@category}")
        else
            @blogpost = Blogpost.all
        end
    end

    def new
        #@blogpost = Blogpost.new
        @blogpost = current_user.blogposts.build
    end

    def create
        #@blogpost = Blogpost.new(req_params)
        @blogpost = current_user.blogposts.build(req_params)
        if @blogpost.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def show
        @blogpost = Blogpost.find(params[:id])
    end

    def edit
        @blogpost = Blogpost.find(params[:id])
    end

    def update
        @blogpost = Blogpost.find(params[:id])
        if @blogpost.update(req_params)
            redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @blogpost = Blogpost.find(params[:id])
        @blogpost.destroy
        redirect_to root_path
    end

    def my_post
        #@blogpost = Blogpost.all
        @blogpost = Blogpost.where(user_id: current_user.id)
    end

    def correct_user
        @blogpost = current_user.blogposts.find_by(id: params[:id])
        redirect_to blogposts_path, notice: "Not an Authorized User" if @blogpost.nil?
    end


    private
    def req_params
        params.require(:blogpost).permit(:title, :body, :user_id, :category)
    end
end