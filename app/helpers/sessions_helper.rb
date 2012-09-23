module SessionsHelper

# Code from ruby.railstutorial.org

  def sign_in(user)
    cookies.permanent[:token] = user.token
    self.current = user
  end

  def current=(user)
    @current = user
  end

  def current
    @current ||= User.find_by_token(cookies[:token])
  end

  def current?(user)
    user == current
  end

  def signed_in?
    !current.nil?
  end

  def sign_out
    self.current = nil
    cookies.delete(:token)
  end

  def signed_in_user
    unless signed_in?
      redirect_to signin_url, notice: "Please sign in."
    end
  end
end
