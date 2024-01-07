class BlogPostsController < ApplicationController

  #This fucntion display all the post in the data base
  def index
    # @instance variable, i can send data to my views
    # BlogPost is an instance of my model
    @blog_posts=BlogPost.all
  end

  def show
    #this is a variable has a value of a especific of the db
    #the params funciton takes the info in the url of the route, it can be a number or anything
    #after params take the info of th url, the find function search in the db which id match whit the argument
    #and tara!! we have all the data in the variable, is like search in an array
    @blog_post =BlogPost.find(params[:id])
    #This is like an exception, when we have a not found error the rescue block is active
    #And redirect us to the root_path
    #root path it's form of reference the root route, but with out the localhost, bla bla. Only the route
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    #In this case we create a new instance variable, with a new instance of the model
    @blog_post = BlogPost.new
  end

  def create
    # We are creating a new instance variable with the params of the blog_post
    # we create a function to take these params, because we cant take it because rails works with strong params
    # and he doesn't take any params, he only take the permited params
    @blog_post = BlogPost.new(blog_post_params)
    #Now if the blogpost is save in the db he show us the current add
    if @blog_post.save
      redirect_to @blog_post
    else
      #else he renders the new action, and change the status of 200 ok to 422 unprocessable_entity
      render :new, status: :unprocessable_entity
    end

  end
  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  #We create this function to protect our form
  #Params is a hash, in the hash we are searching the key of :blog_post
  #if the key (blog_post) is present, with the permit method we indicates which params are allowed
  #else we have an parameterMissing error
  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
