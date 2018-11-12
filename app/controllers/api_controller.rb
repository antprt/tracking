#This class is the parent for the actions for API Rest
class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  def record_not_found
    render json: {
      body: 'RecordNotFound'
    }, status: 404
  end
 
  #Render JSON with response for a single object
  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  #Format for errors validations
  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  def authenticate_user_api!
    unless current_user
      render :json => {'error' => 'authentication error'}, :status => 401
    end
  end
end