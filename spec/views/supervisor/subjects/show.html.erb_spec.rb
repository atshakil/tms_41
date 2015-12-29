require "rails_helper"
require "capybara/rspec"

describe "supervisor/subjects/show.html.erb" do
  subject {rendered}
  let(:subject) {create :subject}

  it {is_expected.not_to have_selector "input"}
  it {is_expected.not_to have_selector "form"}
  it{is_expected.to have_content subject.name
    is_expected.to have_content subject.description
  }
end