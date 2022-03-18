class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_page

  def after_sign_in_path_for(_resoure)
    '/groups'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def current_page
    path = request.path.split('/')

    @new_expense = path.last(2) == %w[expenses new]

    @current_page = ''
    path.reverse_each do |page|
      # don't return ids and 'new'
      if page.to_i.zero? and page != 'new'
        @current_page = page
        break
      end
    end
  end

  private

  # overwrite the authenticate_user! so that it shows my splash screen
  # instead of sign_in
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to '/', notice: 'Please sign in to view that page!'
    end
  end
end
