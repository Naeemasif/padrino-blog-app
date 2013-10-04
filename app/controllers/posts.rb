AppBlog::App.controllers :posts do
		
	get :index, :map =>'/' do
		@title = "Posts"
		@posts = Post.all
		render 'posts/index'
	end
	
	get :login, :map=>'/admin/sessions/new' do
	render 'sessions/new'
	end
	get :logout do
	redirect AppBlog::Admin.url(:sessions, :destroy)
	end

	get :new, :map =>'/new' do
		@post = Post.new
		render 'posts/new'
	end
	
	post :create  do
		@post = Post.new(params[:post])
			if @post.save
				flash[:notice] = 'Post was successfully created.'
				redirect url(:posts, :index)
			else
		render 'posts/new'
			end
	end
	
	delete :destroy, :csrf_protection => false do
		@post = Post.find(params[:id])
			if@post.destroy
				flash[:notice] = 'Post was successfully deleted.'
				redirect url(:posts, :index)
			else
		flash[:notice] = 'Post was not deleted.'
			end
	end
	
	get :edit, :map=>'/edit' do
		@post = Post.find(params[:post_id])
			if @post
				render 'posts/edit'
			else
      
			end
	end
	 
	 put :update do
    
    @post = Post.find(params[:id])
			if @post
				if @post.update_attributes(params[:post])
					redirect url(:posts, :index)
				else
					render 'posts/edit'
				end
			else
		end
  end

end
	
