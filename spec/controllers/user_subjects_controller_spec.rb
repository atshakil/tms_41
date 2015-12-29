require "rails_helper"

describe UserSubjectsController do
  describe "GET #index" do
    before :each do
      @user = create :user
      @course_subject = create :course_subject
    end

    before do
      get :index
    end

    it {expect(response).to render_template :index}
  end

  describe "GET #show" do
    before :each do
      @user = create :user
      @course_subject = create :course_subject
      @user_subject = create :user_subject,
        user: @user, course_subject: @course_subject
    end

    before do
      get :show, id: @user_subject
    end

    it {expect(assigns :user_subject).to eq @user_subject}
    it {expect(response).to render_template :show}
  end

  describe "PATCH #update" do
    before :each do
      UserSubject.destroy_all
      @user = create :user
      @course_subject = create :course_subject
      @user_subject = create :user_subject, user: @user, course_subject: @course_subject
    end

    context "on success" do
      before do
        patch :update, id: @user_subject, user_subject: attributes_for(:user_subject)
      end

      it {expect(assigns :user_subject).to eq @user_subject}
      it {expect(flash[:success]).to have_content I18n.t :task_update_success}
    end

    context "finally"
    it {expect(response).to have_http_status(200)}
  end

end