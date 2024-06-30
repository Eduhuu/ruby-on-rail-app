class CommentsController < ApplicationController
    def create
    @comment = Comment.new(content:params[:content], publication_id:params[:id], user_id:Current.user.id)

      if @comment.save
        # redirect_to 
      else
        flash[:error] = "Failed to create comment: #{@comment.errors.full_messages.join(', ')}"
        render :new, status: :unprocessable_entity
      end
    end
  
    def destroy
      @comment = Comment.find(params[:id])
      @comment.destroy
      redirect_to
    end

    private
  
    def comment_params
      params.require(:comment).permit(:content)
    end
  end