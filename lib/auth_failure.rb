class AuthFailure < Devise::FailureApp
  def redirect_url
    # new_reserva_path
    request.referrer
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      flash[:alert] = I18n.t("devise.sessions.user.not_signed_in")
      redirect_to root_path
    end
  end
end
