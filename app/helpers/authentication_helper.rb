module AuthenticationHelper
  private

  def authenticate_user!
    return if user_signed_in?

    redirect_to splash_screen_path
  end
end
