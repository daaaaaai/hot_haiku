class Haikus::LikesController < ApplicationController
  def create
    @haiku = Haiku.find(params[:haiku_id])
    @haiku.like!

    respond_to do |format|
      format.turbo_stream
    end
  end
end
