require "rails_helper"

describe Supervisor::SubjectsController do
  describe "GET #index" do
    before :each do
      @user = create :user
    end

    before do
      get :index
    end

    it {expect(response).to render_template :index}
    it {expect(assigns :subjects).to match_array []}
  end

  describe "GET #new" do
    before do
      get :new
    end

    it {expect(assigns :subject).to be_a_new Subject}
    it {expect(response).to render_template :new}
  end

  describe "GET #show" do
    before :each do
      @subject = create :subject
    end

    before do
      get :show, id: @subject
    end

    it {expect(assigns :subject).to eq @subject}
    it {expect(response).to render_template :show}
  end

  describe "GET #edit" do
    before :each do
      @subject = create :subject
    end

    before do
      get :edit, id: @subject
    end

    it {expect(response).to render_template :edit}
  end

  describe "POST #create" do
    context "on success" do
      it {expect{
          post :create, subject: attributes_for(:subject)
        }.to change(Subject, :count).by 1
      }

      context "visual property"  do
        before do
          post :create, subject: attributes_for(:subject)
        end

        it {expect(flash[:success]).to have_content I18n.t :subject_creation_success}
        it {expect(response).to render_template :show}
      end
    end

    context "on failure" do
      before do
        post :create, subject: attributes_for(:subject, name: nil)
      end

      it {expect(response).to render_template :new}
    end
  end

  describe "PATCH #update" do
    before :each do
      @subject = create :subject
    end

    context "on success" do
      before do
        patch :update, id: @subject, subject: attributes_for(:subject)
      end

      it {expect(assigns :subject).to eq @subject}
      it {expect(flash[:success]).to have_content I18n.t :subject_update_success}
      it {expect(response).to redirect_to supervisor_subject_path(@subject)}
    end

    context "on failure" do
      before do
        patch :update, id: @subject, subject: attributes_for(:subject, name: nil)
      end

      it {expect(flash[:danger]).to have_content I18n.t :subject_update_failure}
      it {expect(response).to render_template :edit}
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @subject =  create :subject
    end

    context "on success" do
      it {expect{
          delete :destroy, id: @subject
        }.to change(Subject, :count).by -1
      }
      context do
        before do
          delete :destroy, id: @subject
        end

        it {expect(flash[:success]).to have_content I18n.t(:subject_removal_success)}
        it {expect(response).to redirect_to supervisor_subjects_path}
      end
    end
  end

end