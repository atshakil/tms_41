require "rails_helper"

describe Task do

  it {should have_many :course_subject_tasks}
  it {should have_many :user_tasks}
  it {should belong_to :subject}

  it {should have_db_column :name}
  it {should have_db_column :description}
  it {should have_db_column :subject_id}

  it {should validate_presence_of :name}
  it {should validate_uniqueness_of :name}
  it {should_not validate_presence_of :description}

  context "factory" do
    before do
      @task = build :task
    end

    it {expect(@task).to be_valid}
  end

  context "has property that" do
    it {@task = build :task,
      name: "A Task",
      description: "A task description"
      expect(@task).to be_valid
    }
  end
end
