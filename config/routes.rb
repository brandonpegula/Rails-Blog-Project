Rails.application.routes.draw do
  get 'blogs/index'

  get 'blogs/create'

  get 'blogs/new'

  get 'blogs/show'

  get 'blogs/edit'

  get 'blogs/update'

  get 'blogs/destroy'

  get 'users/index'

  get 'users/new'

  get 'users/show'

  get 'users/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
