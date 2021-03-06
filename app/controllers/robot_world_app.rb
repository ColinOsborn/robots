class RobotWorldApp < Sinatra::Base

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
    robot_id = robot_repository.create(params[:robot])
    redirect "/robots/#{robot_id}"
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
    redirect "/robots/#{id}"
  end

  delete '/robot/:id' do |id|
    robot_repository.destroy(id.to_i)
    redirect "/robots"
  end

  def robot_repository
    if ENV['RACK_ENV'] == "test"
      database = Sequel.postgres('robot_repository_test')
    else
      database = Sequel.postgres('robot_repository')
    end
    @robot_repository ||= RobotRepository.new(database)
  end
end
