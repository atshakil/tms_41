require "rails_helper"
require "capybara/rspec"

describe "supervisor/subjects/index.html.erb" do
  subject {rendered}
  let(:subject) {create :subject}
  let(:subjects) {Subject.all}

  it {is_expected.not_to have_selector "input"}
  it {is_expected.not_to have_selector "form"}
  context "where it" do
    it {subjects.each do |subject|
      is_expected.to have_content subject.name
      is_expected.to have_content subject.description
    end
    }
  end
end