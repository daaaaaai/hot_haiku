class CommentsController < ApplicationController
  def create
    comment = Haiku.find(params[:haiku_id]).comments.build(comment_params)

    comment.save

    respond_to do |format|
      flash[:notice] = "評を投稿しました"
      format.turbo_stream
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :name)
    end
end
