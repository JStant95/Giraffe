require 'sinatra/base'
require './lib/filmography.rb'

class FilmInfo < Sinatra::Base
  get '/' do
    Filmography.show(params[:actor]).to_json
  end

  run! if app_file == $0
end
