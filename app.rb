require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  set :sessions, true
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    # player names stored as attributes of instances of Player class in global variables
    # require 'pry'; binding.pry
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    $game = Game.new(player_1, player_2)
    redirect to('/play')
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  # get '/finish' do
  #   @game = $game
  #   if @game.finish?
  #     redirect to('/win')
  #   else
  #     redirect to('/attack')
  #   end
  # end

  get '/attack' do
    @game = $game
    # if @game.finish?
    #   redirect to('/win')
    #     else
          @game.attack(@game.player_2)
          erb(:attack)
        # end
  end

  get '/win' do
    @game = $game
    erb(:win)
  end

  get '/switch' do
    @game = $game
    if @game.finish?
      redirect to('/win')
    else
      @game.switch_player
      redirect to('/play')
    end
  end

  get '/damage' do
    @game = $game
    erb(:damage)
  end

  get '/prize' do
    @game = $game
    erb(:prize)
  end
  
end
