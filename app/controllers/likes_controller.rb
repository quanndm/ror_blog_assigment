class LikesController < ApplicationController
    skip_before_action :verify_authenticity_token

    before_action only: %i[ update ]
    def update
        # logger.info params
        if user_signed_in?

            like = Like.where(likeable_id: params["likeable_id"], likeable_type: params["likeable_type"], users_id: current_user.id).first
            if !like
                Like.create(likeable_id: params["likeable_id"], likeable_type: params["likeable_type"], users_id: current_user.id)
            else
                like.destroy
            end

            if  params["likeable_type"] == 'Comment'
                
                redirect_to post_url(Comment.find(params["likeable_id"]).post.id)
            else
                redirect_to post_url(params["likeable_id"])
            end
        else
            redirect_to posts_url
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :title, :content)
    end
end
