# encoding: utf-8

class Public::SessionsController < ApplicationController
  expose(:user_session) { Session.new(params[:session]) }

  def destroy
    url = params[:p]
    url ||= root_path
    self.clear_user
    redirect_to url, :notice => 'Hasta pronto!'
  end

  def new
    store_location(params[:p]) if params[:p].present?
  end

  def create
    if user_session.save
      session[:user_id] = user_session.user.id
      redirect_to stored_or(root_url), :notice => "Bienvenidx!"
    else
      flash.now.notice = "La dirección de correo electrónico o la contraseña no son correctas."
      render "new"
    end
  end

  def enter
    unless Rails.env.production?
      self.current_user = User.find params[:id]
      flash[:notice] = "Te has colado como #{current_user.name}"
      redirect_to stored_or(root_path)
    end
  end

end
