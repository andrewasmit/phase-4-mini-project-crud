class SpicesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_spice_found_res

    def show
        spice = find_spice
        render json: spice
    end

    def index
        render json: Spice.all
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice
    end

    def destroy
        spice=find_spice
        spice.destroy
        head :no_content
    end
    
    def update
        spice=find_spice
        spice.update(spice_params)
        render json: spice
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

    def render_spice_found_res
        render json: { error: "Spice Not Found" }, status: :not_found
    end

end
