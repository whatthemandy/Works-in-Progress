Blogger::Application.routes.draw do

  root to: 'articles#index'  # makes '/' show our articles index page

  resources :articles
end

# rake routes:
#       Prefix   Verb     URI Pattern                    Controller#Action
#     articles   GET      /articles(.:format)            articles#index
#                POST     /articles(.:format)            articles#create
#  new_article   GET      /articles/new(.:format)        articles#new
# edit_article   GET      /articles/:id/edit(.:format)   articles#edit
#      article   GET      /articles/:id(.:format)        articles#show
#                PATCH    /articles/:id(.:format)        articles#update
#                PUT      /articles/:id(.:format)        articles#update
#                DELETE   /articles/:id(.:format)        articles#destroy
