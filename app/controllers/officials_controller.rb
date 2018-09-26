class OfficialsController < ApplicationController

	def sign_in_get
	end

  def sign_in
  	email = params[:email]
    password = params[:password]
    off_code = params[:off_code]

    official = Official.find_by_email(email)

    if official

      if official.password == password and official.off_code == off_code
        session[:official_id] = official.id
        return redirect_to official_dashboard_path
      else
        return redirect_to sign_in_get_official_path
      end

    else
      return redirect_to '/'
    end
  end

  def logout
  	session[:official_id] = nil
    return redirect_to '/'
  end

end
