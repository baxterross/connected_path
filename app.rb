$:.unshift __FILE__, '.'

require 'sinatra'
require 'sinatra/activerecord'

require 'dotenv'
Dotenv.load

require_relative 'helpers/application_helpers.rb'

require_relative 'models/phone_number.rb'
require_relative 'models/user.rb'
require_relative 'models/message.rb'

require_relative 'controllers/application_controller.rb'

class ConnectedPath < Sinatra::Application

  helpers ApplicationHelpers

  register Sinatra::ActiveRecordExtension
  if self.development?
    set :database_file, 'config/database.yml'
  else
    puts 'DB URL:', ENV['DATABASE_URL']
    puts ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])
  end

  set :root, File.dirname(__FILE__)

  before do
    content_type 'application/json'
  end
  
end
