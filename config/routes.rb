Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # The routes are excecuted in order 
  get "/blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  # the :id in the url its a variable, and the blog post is a reference for the entire url, it can be used in the views
  get "/blog_posts/:id", to: "blog_posts#show", as: :blog_post
  patch "/blog_posts/:id", to: "blog_posts#update"
  get "/blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post
  post "/blog_posts", to: "blog_posts#create", as: :blog_posts


  # Defines the root path route ("/")
  root "blog_posts#index"

end
