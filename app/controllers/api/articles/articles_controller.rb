class Api::Articles::ArticlesController < ApiController
  def index
    render json: { health: 'OK' }
  end
end
