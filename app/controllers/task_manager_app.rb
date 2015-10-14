class TaskManagerApp < Sinatra::Base #set and other words are inhereted from sinatra.

  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = TaskManager.all
    erb :index
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end

  get '/tasks/:id' do |id|
     @task = TaskManager.find(id.to_i)
     erb :show
  end

  get '/tasks/:id/edit' do |id|
    @task = TaskManager.find(id.to_i)
    erb :edit
  end

  put '/tasks/:id' do |id|
    TaskManager.update(id.to_i, params[:task])
    redirect '/tasks'
  end

  delete '/tasks/:id' do |id|
    TaskManager.delete(id.to_i)
    redirect '/tasks'
  end

  not_found do
    erb :error
  end


end
