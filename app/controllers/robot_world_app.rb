require 'models/robot_repository'

class RobotWorldApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    erb :dashboard
  end

  get '/robots' do
    @robots = robot_repository.all
    erb :index
  end

  get '/robots/new' do
    erb :new
  end

  post '/robots' do
    robot_repository.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = robot_repository.find(id.to_i)
    erb :show
  end

  get '/robots/:id/edit' do |id|
    @robot = robot_repository.find(id.to_i)
    erb :edit
  end

  put '/robots/:id' do |id|
    robot_repository.update(id.to_i, params[:robot])
    redirect "/robots#{id}"
  end 

  def robot_repository
    database = YAML::Store.new('db/robot_repository')
    @robot_repository ||= RobotRepository.new(database)
  end

end