Blogger::Application.routes.draw do

  root to: 'articles#index'  # makes '/' show our articles index page

  resources :articles do
    resources :comments  # specify comments as a sub-resource (nested inside articles)
  end

  resources :authors

  resources :author_sessions, only: [ :new, :create, :destroy ]

    get 'login'  => 'author_sessions#new'
    get 'logout' => 'author_sessions#destroy'

end


# rake routes
#               Prefix Verb   URI Pattern                                       Controller#Action
#                 root GET    /                                                 articles#index
#     article_comments GET    /articles/:article_id/comments(.:format)          comments#index
#                      POST   /articles/:article_id/comments(.:format)          comments#create
#  new_article_comment GET    /articles/:article_id/comments/new(.:format)      comments#new
# edit_article_comment GET    /articles/:article_id/comments/:id/edit(.:format) comments#edit
#      article_comment GET    /articles/:article_id/comments/:id(.:format)      comments#show
#                      PATCH  /articles/:article_id/comments/:id(.:format)      comments#update
#                      PUT    /articles/:article_id/comments/:id(.:format)      comments#update
#                      DELETE /articles/:article_id/comments/:id(.:format)      comments#destroy
#             articles GET    /articles(.:format)                               articles#index
#                      POST   /articles(.:format)                               articles#create
#          new_article GET    /articles/new(.:format)                           articles#new
#         edit_article GET    /articles/:id/edit(.:format)                      articles#edit
#              article GET    /articles/:id(.:format)                           articles#show
#                      PATCH  /articles/:id(.:format)                           articles#update
#                      PUT    /articles/:id(.:format)                           articles#update
#                      DELETE /articles/:id(.:format)                           articles#destroy
#              authors GET    /authors(.:format)                                authors#index
#                      POST   /authors(.:format)                                authors#create
#           new_author GET    /authors/new(.:format)                            authors#new
#          edit_author GET    /authors/:id/edit(.:format)                       authors#edit
#               author GET    /authors/:id(.:format)                            authors#show
#                      PATCH  /authors/:id(.:format)                            authors#update
#                      PUT    /authors/:id(.:format)                            authors#update
#                      DELETE /authors/:id(.:format)                            authors#destroy
#      author_sessions POST   /author_sessions(.:format)                        author_sessions#create
#   new_author_session GET    /author_sessions/new(.:format)                    author_sessions#new
#       author_session DELETE /author_sessions/:id(.:format)                    author_sessions#destroy
#                login GET    /login(.:format)                                  author_sessions#new
#               logout GET    /logout(.:format)                                 author_sessions#destroy
