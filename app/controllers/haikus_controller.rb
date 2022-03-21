class HaikusController < ApplicationController
  # GET /haikus or /haikus.json
  def index
    # flash[:notice] = "ようこそ"

    @haiku = Haiku.new
    @haikus = Haiku.order(created_at: :desc).page(params[:page]).per(10)
  end

  # GET /haikus/1 or /haikus/1.json
  def show
    @haiku = Haiku.find(params[:id])
  end

  # POST /haikus or /haikus.json
  def create
    @haiku = Haiku.new(haiku_params)
    @haikus = Haiku.order(created_at: :desc).page(params[:page]).per(10)

    respond_to do |format|
      if @haiku.save
        flash[:notice] = "俳句を投稿しました"
        format.html { redirect_to haikus_url}
        format.json { render :show, status: :created, location: @haiku }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @haiku.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def haiku_params
      params.require(:haiku).permit(:content, :author_name)
    end
end
