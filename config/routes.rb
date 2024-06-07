Rails.application.routes.draw do
  get 'choice/show'
  get 'question/show'
  get 'question/update'

  scope controller: 'choice' do
    get 'choice/:question_id' => :new, as: :choice_new
    post 'choice/create' => :create, as: :choice_create
    get 'choice/:question_id/all' => :index, as: :choice_index
    delete 'choice/:id' => :delete, as: :choice_delete
    get 'choice/:id/edit' => :edit , as: :choice_edit
    patch 'choice/:id/update' => :update, as: :choice_update
  end

  scope controller: 'test_takers' do
    get "users/:test_id" => :index, as: :test_takers_index
    get "users/:test_id/new" => :new, as: :test_takers_new
    post "users/:test_id/create" => :create, as: :test_takers_create
  end

  scope controller: 'static' do
    get 'not_found' => :not_found
    get 'error' => :error
  end

  scope controller: 'question' do
    get ':test/question/new' => :new, as: :question_new
    post ':test/question/create' => :create, as: :question_create
    delete 'question/:id' => :delete, as: :question_delete
  end

  get 'admin/index'
  get 'admin/tests'
  get 'admin/new_test'
  get 'sessions/destroy'

  scope controller: 'admin' do
    get 'deploy/:id' => :deploy, as: :admin_test_deploy
    patch 'deploy/:id' => :deploy, as: :admin_test_deploy_edit
  end

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
