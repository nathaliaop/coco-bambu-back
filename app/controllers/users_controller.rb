class UsersController < ApplicationController
  before_action :authorize_request, only: [:show]
  before_action :authorize_request_admin, except: [:show]
  
  #Inclui o conteúdo e a image de banner nas postagens com paginação
  def index
    users = User.all
    render json: users, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: user, status: :ok
  end
  

  def create
    user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :password_confirmation)
  end    
end
