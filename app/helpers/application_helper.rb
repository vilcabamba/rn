module ApplicationHelper
  ##
  # @param key [String] flash message key
  # @return [String] css class for a given flash
  #   key. This is considering we are using
  #   twitter bootstrap and it's default alerts
  def flash_message_class_for(key)
    case key
    when "notice"
      "success"
    when "error"
      "danger"
    when "alert"
      "warning"
    else
      key
    end
  end

  ##
  # @return [String] sign-up path if not logged
  #   in. Will send to expositores if already
  #   logged in
  def inscribete_path
    if current_user
      expositores_path(signed_in: true)
    else
      new_user_registration_path
    end
  end
end
