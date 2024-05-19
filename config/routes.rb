Rails.application.routes.draw do
  get 'admin/index'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  resources :users
  resources :events

  # Assignment controller routes.
  scope controller: 'assignments' do
    get '/assignments', action: 'index', as: 'assignments_index'
    get '/assignment/:id', action: 'show', as: 'assignments_show'
  end

  scope controller: 'student_assignments' do
    get '/feed/:id', action: 'feed', as: 'student_assignments_view_events'
  end
end
