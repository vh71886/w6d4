class ArtworksController < ApplicationController

    def index
        # @artworks = Artwork.all
        @artworks = User.find(params[:user_id]).artworks
        render json: @artworks    
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])

        if artwork.update(artwork_params)
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        # debugger
        artwork = Artwork.find(params[:id])

        if artwork.destroy
            render json: artwork
            # redirect_to artworks_url
        else
            render json: 'cant delete artpiece'
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end 
end