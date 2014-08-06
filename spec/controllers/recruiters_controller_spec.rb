require 'spec_helper'
describe RecruitersController do
    describe 'GET #show' do
       it "assigns the requested recruiter to @recruiter" do
        recruiter =create(:recruiter)
         get :show, id: recruiter
          expect(assigns(:recruiter)).to eq recruiter
       end
       it "renders the :show template" do
        get :show,id: create(:recruiter)
         expect(response).to render_template :show
       end
    end
    describe 'GET #new' do
        it "assigns a new Recruiter to @recruiter" do
            get :new
             expect(assigns(:recruiter)).to be_a_new(Recruiter)
        end
        it "renders the :new template"do
        get :new
         expect(response).to render_template :new
        end
    end
    describe "POST #create" do
        context "with valid attributes" do
            it "saves the new recruiter in the database" do
                expect{
                    post :create, recruiter: attributes_for(:recruiter)
                    }.to change(Recruiter, :count).by(1)
            end
            it "redirects to reruiter#show" do
                post :create,recruiter: attributes_for(:recruiter)
                expect(response).to redirect_to recruitersignin_path


            end
        end
        context "with invalid attributes" do
            it "does not save the new recruiter in the database" do
                expect{
                    post :create, recruiter: attributes_for(:invalid_recruiter)
                    }.to_not change(Recruiter, :count)
            end
            it "re-renders the :new template"do
            post :create, recruiter: attributes_for(:invalid_recruiter)
            expect(response).to render_template :new
        end
        end
    end
end