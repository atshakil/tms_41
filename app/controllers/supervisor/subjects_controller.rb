class Supervisor::SubjectsController < ApplicationController
  before_action :load_user, only: [:index]
  before_action :load_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = @user.subjects
  end

  def new
    @subject = Subject.new
    @subject.tasks.build
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash.now[:success] = t :subject_creation_success
      render :show
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t :subject_update_success
      redirect_to [:supervisor, @subject]
    else
      flash.now[:danger] = t :subject_update_failure
      render :edit
    end
  end

  def destroy
    if @subject.destroy
      flash[:success] = t :subject_removal_success
      redirect_to supervisor_subjects_path
    else
      flash.now[:danger] = t :subject_removal_failure
      render :show
    end
  end

  private
  def load_user
    @user = User.first #Incompatibility 1: Please see SpecificationNotes.md
  end

  def load_subject
    @subject = Subject.find params[:id]
  end

  def subject_params
    params.require(:subject).permit(:name, :description, tasks_attributes:
      [:id, :name, :description, :_destroy])
  end
end