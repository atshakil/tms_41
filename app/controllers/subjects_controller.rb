class SubjectsController < ApplicationController
  before_action :load_user, only: [:index]

  def index
    @subjects = @user.subjects
  end

  def new
  end

  def show
  end

  def edit
  end


  private
    def load_user
      @user = User.first
    end
end