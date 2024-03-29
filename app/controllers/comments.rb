AppBlog::App.controllers :comments do
  
	get :index, :map => '/index'do
		@post = Post.find(params[:post_id])
		@comments = @post.comments
		#@count = @post.comments.count
		render 'comments/index'
	end
	
	get :new, :map =>'/new_comment' do
		@comment = Comment.new
		render 'comments/new_comment'
	end

	post :create do
		@post = Post.find(params[:post_id]) 
		@comment = @post.comments.new(params[:comment]) 
			if @comment.save
				flash[:notice] = 'Post was successfully created.'
				redirect url(:posts, :index)
			else
				render 'comments/new'
			end
	end

end
