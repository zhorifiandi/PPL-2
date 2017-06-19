class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      # redirect_to user_url(user)
      if user.role == "mahasiswa"
        redirect_to mahasiswa_index_path
      elsif user.role == "dosen"
        redirect_to pilih_role_dosens_path
      elsif user.role == "tu"
        redirect_to tu_index_path
      else
        redirect_to registrasi_user_admin_index_path
    end
    else
      # Create an error message.
      redirect_to root_url, alert: "Invalid Username / Password Combination"

    end
  end
  def destroy
    log_out
    redirect_to root_url
    # render root_path
    # redirect_to root_path
    # redirect_to controller: 'sessions', action: 'new'

  end
end
