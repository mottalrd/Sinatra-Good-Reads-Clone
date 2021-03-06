class SessionsController < ApplicationController

  get '/login' do
    if logged_in?
      redirect :"/"
    else
      erb :'/sessions/login'
    end
  end

  post '/login' do
    if params[:username] != '' && params[:password] != ''
      login(params)
    else
      flash[:alert] = "All fields need to be completed"
      redirect :'/login'
    end
  end

  get '/logout' do
    if logged_in?
      logout
    end
    redirect :'/login'
  end

end
