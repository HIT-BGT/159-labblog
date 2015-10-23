class PostsController < ApplicationController

def index
	@posts = Post.all
end

def show
	@post = Post.find(params[:id])
end

def new
	@post = Post.new
end

def create
	@post = Post.new(params[:post])
	if @post.save
		redirect_to posts_path, :notice => "Successlly created!"
	else
		render "new"
	end
end

def edit
	@post = Post.find(params[:id])
end

def update
	@post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
end
 
def destroy
	@post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
  end
end

end
