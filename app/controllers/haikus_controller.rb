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

  # POST /haikus
  def create
    @posted_haiku = Haiku.new(haiku_params)
    @haikus = Haiku.order(created_at: :desc).page(params[:page]).per(10)

    respond_to do |format|
      if @posted_haiku.save
        @haiku = Haiku.new
        flash[:notice] = @posted_haiku.author_name + "として俳句を投稿しました"
        format.turbo_stream
      else
        @haiku = Haiku.new(haiku_params)

        flash[:notice] = "投稿に失敗しました"
        flash[:alert] = @posted_haiku.errors.map{|error|
           error.full_message
        }.join("\n")

        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @posted_haiku.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def haiku_params
      params.require(:haiku).permit(:content, :author_name)
    end
end
