require 'bundler'
Bundler.require

APP_ROOT = File.expand_path("..", __dir__)

#require the controller(s)
Dir.glob(File.join(APP_ROOT, "app", "controllers", "*.rb")).each { |file| require file }

Dir.glob(File.join(APP_ROOT, "app", "models", "*.rb")).each { |file| require file }



class RobotWorldApp < Sinatra::Base
  set :root, APP_ROOT
  set :method_override, true
  set :views, File.join(APP_ROOT, 'app', 'views')
  set :public_folder, File.join(APP_ROOT, 'app', 'views', 'public')
end
