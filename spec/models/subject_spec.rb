require "rails_helper"

describe Subject do
  it {should have_many(:course_subjects).dependent :destroy}
  it {should have_many(:courses).through(:course_subjects).autosave true}
  it {should have_many(:tasks).dependent :destroy}
  it {should accept_nested_attributes_for :tasks}

  it {should have_db_column :name}
  it {should have_db_column :description}

  it {should validate_presence_of :name}
  it {should validate_uniqueness_of :name}

  context "factory" do
    before do
      @subject = build :subject
    end

    it {expect(@subject).to be_valid}
  end

  context "has property that" do
    it {@subject = build :subject,
        name: "A Subject",
        description: "A subject description"
      expect(@subject).to be_valid
    }
    it {subject = build :subject, description: nil
      subject.valid?
      expect(subject.errors[:description]).to be_empty
    }
    it {subject = build :subject, name: nil
      subject.valid?
      expect(subject.errors[:name]).to include "can't be blank"
    }
  end

  context "when being created" do
    before do
      create :subject,
        name: "A Subject",
        description: "A subject description"
      @subject = build :subject,
        name: "A Subject",
        description: "A subject description"
      @subject.valid?
    end

    it {expect(@subject.errors[:name]).to include "has already been taken"}
  end
end
