class ArtworkSharesController < ApplicationController
    def index
        artwork_shares = ArtworkShare.all
        render json: artwork_shares
    end

    # def index(user_id)
    #     artwork_shares = ArtworkShare.find(params[user_id])
    #     render json: artwork_shares
    #  end

    def create
        artwork_share = ArtworkShare.new(artwork_share_params)
        if artwork_share.save
            render json: artwork_share
        else
            render json: artwork_share.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        artwork_share = ArtworkShares.find(params[:id])
        artwork_share.destroy
        redirect_to artwork_share_url(artwork_share)
    end

    private
    def artwork_share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
