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
    #root path it's form of reference the root route, but with out the localhost, bla bla
    #only the route
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post
    else
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

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
