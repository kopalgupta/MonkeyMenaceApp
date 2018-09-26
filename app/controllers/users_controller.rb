class UsersController < ApplicationController

	def sign_in_get
  end

  def sign_up_get
  end

  def sign_up
  	name = params[:name]
    email = params[:email]
    password = params[:password]
    phone = params[:handle]
    address = params[:address]

    user = User.find_by_email(email)

    unless user
      user = User.create(name: name, email: email, password: password, phone: phone, address: address)
      session[:user_id] = user.id
      user.save
      return redirect_to user_dashboard_path
    else
      return redirect_to '/sign_up'
    end
  end

  def sign_in
  	email = params[:email]
    password = params[:password]

    user = User.find_by_email(email)

    if user

      if user.password == password
        session[:user_id] = user.id
        return redirect_to user_dashboard_path
      else
        return redirect_to '/sign_in'
      end

    else
      return redirect_to '/sign_up'
    end
  end

  def logout
  	session[:user_id] = nil
    return redirect_to '/'
  end


end
