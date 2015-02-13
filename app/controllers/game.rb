get '/lobby' do
  if session[:user].nil?
    @error = "You must be logged in to Play"
    erb :index
  else
    @user = User.where(id: session[:user]).first
    erb :lobby
  end
end

get '/play/:game' do
  @game = Game.where(id: params[:game]).first
  @player1 = User.where(id: @game.player1).first
  @player2 = User.where(id: @game.player2).first
  @hash = {}; counter = 0
  @game.board.split("").each do |grid|
    if grid != "0"; @hash[counter] = grid; end
    counter += 1
  end
  erb :game
end

post '/play/:gameid/' do
  game = Game.where(id: params[:gameid]).first
  # game.change(params[:click],params[:turn])
  if params[:turn]
    newboard = game.board
    newboard[params[:click].to_i] = params[:turn]
    game.update(board: newboard)
  end
  "#{params}"
end

get '/user/:user' do
  @user = User.where(id: params[:user]).first
  @games = Game.history(params[:user])
  erb :user
end