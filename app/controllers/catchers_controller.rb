class CatchersController < ApplicationController

  def sign_in_get
  end

  def sign_up_get
  end

  def sign_up
  	name = params[:name]
    phone = params[:phone]
    password = params[:password]
    location = params[:location]
    price = params[:price]

    catcher = Catcher.find_by_phone(phone)

    unless catcher
      catcher = Catcher.create(name: name, phone: phone, password: password, location: location, price: price)
      session[:catcher_id] = catcher.id
      catcher.save
      return redirect_to catcher_dashboard_path
    else
      return redirect_to '/catchers/sign_up'
    end
  end

  def sign_in
  	phone = params[:phone]
    password = params[:password]

    catcher = Catcher.find_by_phone(phone)

    if catcher

      if catcher.password == password
        session[:catcher_id] = catcher.id
        return redirect_to catcher_dashboard_path
      else
        return redirect_to '/catchers/sign_in'
      end

    else
      return redirect_to '/catchers/sign_up'
    end
  end

  def logout
  	session[:catcher_id] = nil
    return redirect_to '/'
  end


end
