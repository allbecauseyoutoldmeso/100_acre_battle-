require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base

  get '/' do
    erb(:index)
  end

  post '/names' do
    # player names stored as attributes of instances of Player class in global variables
    # require 'pry'; binding.pry
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.create(player_1, player_2)
    redirect to('/play')
  end

  before do
    @game = Game.instance
  end

  get '/play' do
    erb(:play)
  end

  post '/food' do
    $food = params[:food]
    @game.attack(@game.opponent)
    if @game.finish?
      redirect to('/win')
    else
      redirect to('/attack')
    end
  end

  get '/attack' do
    @game.attack(@game.opponent)
    erb(:attack)
  end

  get '/win' do
    erb(:win)
  end

  get '/switch' do
      @game.switch_turn
      redirect to('/play')
  end

  get '/damage' do
    erb(:damage)
  end

  get '/prize' do
    erb(:prize)
  end

end
