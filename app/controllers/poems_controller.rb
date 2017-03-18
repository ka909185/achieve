class PoemsController < ApplicationController
  def index
    @poem = Poem.all
  end
  # GET /poems/1
  # GET /poems/1.json
  def show
    @poem = Poem.find(params[:id])
  end

end
