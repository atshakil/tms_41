class Task < ActiveRecord::Base
  belongs_to :subject
  belongs_to :course_subject
  has_many :course_subject_tasks
  has_many :user_tasks

  belongs_to :user
  belongs_to :user_subject_task

  validates :name, uniqueness: true, presence: true
end