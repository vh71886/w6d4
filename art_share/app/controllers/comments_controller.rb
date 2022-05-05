

    def index 
        # render plain: 'Dave and veras first rails request'
        @comments = User.find(params[:user_id]).comments
        render json: @comments
    end

    def create
        comment = Comment.new(comment_params)
    
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    # def show
    #     user = User.find(params[:id])
    #     render json: user
    # end

    # def update
    #     # debugger
    #     user = User.find(params[:id])
    #     if user.update(user_params)
    #         # debugger
    #         render json: user
    #     else
    #         # debugger
    #         render json: user.errors.full_messages, status: :unprocessable_entity
    #     end
    # end

    def destroy 
        comment = Comment.find(params[:id])

        if comment.destroy
            # redirect_to comments_url
            render json: comment
        else
            render json: 'Cant delete comment'
        end
    end

    private 
    def comment_params
        params.require(:comment).permit(:body, :user_id, :artwork_id)
    end
end