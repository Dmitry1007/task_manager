require 'sinatra'
require 'models/task_manager'

class TaskManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  # initially :root = "app/controllers/.."
  # after set :root = "./.."
# require 'pry'; binding.pry
  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = ['Task1', 'Task2', 'Task3']
    erb :index  
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    TaskManager.create(params[:task])
    redirect '/tasks'
  end
end