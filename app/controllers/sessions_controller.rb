class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: [:create, :destroy]

  private

  def respond_with(resource, _opts = {})
    if request.headers["CONTENT_TYPE"]=='application/json'
      render json: resource
    else
      super
    end
  end

  def respond_to_on_destroy
    if request.headers["CONTENT_TYPE"]=='application/json'
      head :no_content
    else
      super
    end
  end
end