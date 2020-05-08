class Api::V1::UsersController < ApplicationController

def index
  @users = User.all
    respond_to do |format|
      format.json {render :json => @users.to_json, :status => :ok}
    end
  end

def create
end

def update
end

def show
end

def destroy
end

end
