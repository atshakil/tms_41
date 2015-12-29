class UserSubjectsController < ApplicationController
  before_action :load_status, only: [:show, :update]
  before_action :load_user, only: :index

  def index
    @subjects = @user.subjects
  end

  def show
    @new_tasks.count.times { @user_subject.user_tasks.build }
  end

  def update
    begin
      @user_subject.update_attributes user_subject_params
      flash[:success] = t :task_update_success
    rescue
      flash[:danger] = t :task_update_failure
    end
    redirect_to @user_subject
  end

  private
  def load_user
    @user = User.first # Incompatibility 1: Please see SpecificationNotes.md
  end

  def load_dependencies
    load_user
    @user_subject = @user.user_subjects.find params[:id]
    @subject = @user_subject.subject
    @tasks = @subject.tasks
    @user_tasks = @user_subject.tasks
    @new_tasks=Array.new
    @tasks.each {|task| @new_tasks<<task if @user_tasks.exclude? task}
  end

  def load_status
    load_dependencies
    @status=[]
    course_subject = @user_subject.course_subject
    user_subject_status = @user_subject.status
    course_subject_status = course_subject.status
    if course_subject_status == :finished
      @status<<course_subject_status
    else
      @status<<user_subject_status
    end
    @status<<
        course_subject.course.start_date.to_date<<
        course_subject.course.end_date.to_date
  end

  def user_subject_params
    params.require(:user_subject).permit user_tasks_attributes: [:id,
      :user_id, :task_id, :_destroy]
  end
end