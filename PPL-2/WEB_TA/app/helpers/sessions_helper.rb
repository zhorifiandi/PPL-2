module SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def logged_in?
    !current_user.nil?
  end
  def log_out
    @current_user = nil
    session.delete(:user_id)
    # reset_session

  end
  def can_access_ta2
    seminar = Seminar.find_by(nim: current_user.username)
    if seminar ==  nil
      return false
    else
      if seminar.nilai_total_penguji != nil && seminar.nilai_total_pembimbing != nil
        return true
      else
        return false
      end
    end
  end
end
