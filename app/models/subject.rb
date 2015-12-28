class Subject < ActiveRecord::Base
  has_many :course_subjects, dependent: :destroy
  has_many :courses, through: :course_subjects, autosave: true

  has_many :tasks, dependent: :destroy

  belongs_to :user_subject

  accepts_nested_attributes_for :tasks,
    reject_if:
      proc { |attributes| attributes["name"].blank? },
        allow_destroy: true

  validates :name, presence: true, uniqueness: true

  include PublicActivity::Model
  tracked except: :destroy, owner: ->(controller, model) {controller && controller.current_user}
end
