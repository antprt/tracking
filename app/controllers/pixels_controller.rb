class PixelsController < ApiController
  before_action :authenticate_user_api!
  before_action :set_pixel, only: [:update]

  def create
    @pixel = Pixel.new
    @pixel.assign_attributes(pixel_params)
    @pixel.save
    render_resource(@pixel)
  end

  def update
    @pixel.conversions += 1
    @pixel.save
    render_resource(@pixel)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pixel
      @pixel = Pixel.find_by!(name: params[:name])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pixel_params
      params.require(:pixel).permit(:name, :provider_id)
    end
end
