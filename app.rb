require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  set :sessions, true
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    # player names stored as attributes of instances of Player class in global variables
    # require 'pry'; binding.pry
    $player_1 = Player.new(params[:player_1])
    $player_2 = Player.new(params[:player_2])
    redirect to('/play')
  end

  get '/play' do
    @player_1 = $player_1.name
    @player_2 = $player_2.name
    erb(:play)
  end

  get '/attack' do
    @player_1 = $player_1
    @player_2 = $player_2
    @player_1.attack(@player_2)

    erb(:attack)
  end

end
