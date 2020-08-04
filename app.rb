require 'sinatra/base'
require './lib/filmography.rb'
require './lib/cast.rb'

class FilmInfo < Sinatra::Base
  get '/' do
    if params[:actor]
      Filmography.show(params[:actor]).to_json
    elsif params[:film]
      Cast.show(params[:film]).to_json
    else
      "Please input an actor or film as a parameter"
    end
  end

  run! if app_file == $0
end
