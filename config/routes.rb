Rails.application.routes.draw do
  get 'question/new'
  get 'question/create'
  get 'question/show'
  get 'question/update'
  get 'question/delete'

  scope controller: 'static' do
    get 'not_found' => :not_found
    get 'error' => :error
  end

  get 'admin/index'
  get 'admin/tests'
  get 'admin/new_test'
  get 'sessions/destroy'

  scope controller: 'sessions' do
    get 'login' => :new
    post 'login' => :create, as: :login_session
    delete 'logout' => :destroy
  end

  scope controller: 'tests' do
    get 'tests/new' => :new
    post 'tests/create' => :create
    get 'tests/:id' => :show, as: "tests_show"
  end

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
