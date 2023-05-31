module AuthenticationHelper
  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to splash_screen_path
    end
  end
end