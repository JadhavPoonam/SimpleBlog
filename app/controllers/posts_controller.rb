class PostsController < ApplicationController
	http_basic_authenticate_with name: "tester", password:"1234", except: [:index, :show]
	
	def index
		@posts = Post.all
	end

	def new
		#variable used to display validation errors based as defined in the model class
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		#render plain: params[:post].inspect
		#@post is a variable
		#Post is the model name
		#params from the post request i.e params[:post] - this causes forbidden error
		#so we create another method that permits the parameters access and pass that metjhod name here


		@post = Post.new(post_params)
		
		#load the show view
		if(@post.save)
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])

	end

	def update
		@post = Post.find(params[:id])

		if(@post.update(post_params))
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])

		@post.destroy
		redirect_to posts_path
	end

	private def post_params
		params.require(:post).permit(:title, :body)
	end
end
