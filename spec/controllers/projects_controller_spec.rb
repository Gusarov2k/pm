require 'rails_helper'

# RSpec.describe ProjectsController, type: :controller do

	describe ProjectsController do
		context "when user not logged in" do
			describe "GET #index" do
				it "redirect to login page" do
					get :index
					expect(response).to redirect_to new_user_session_path
				end
			end
		end

		context "when user logged in" do
			let(:user) {FactoryBot.create(:user)}
			subject {FactoryBot.create(:project, owner: user)}

			before do
				sing_in user
			end

			describe "GET #index" do
				it "render :index view" do
					get :index
					expect(response).to render_template :index
				end

				it "assigns the requested project to subject" do
					get :index
					expect(assigns(:project)).to eq([subject])
				end

			end

		end

		context "when user logged id" do
			let(:user) {FactoryBot.create(:user)}
			subject {FactoryBot.create(:project, owner: user)}

			before do
				sing_in user
			end

			describe "GET #show" do
				it "assigns the requested project to subject" do
					get :show, id: subject
					expect(assigns(:project)).to eq(subject)
				end

				it "renders the :show view" do
					get :show, id: subject
					expect(response).to render_template :show
				end
			end

			describe "GET #new" do
				it "assigns the requested project to new project" do
					get :new
					expect(assigns(:project)).to be_new_record
				end

				it "renders the :new view" do
					get :new
					expect(response).to render_template :new
				end
			end

			describe "POST #create" do
				context "with valid attributes" do
					it "creates new object" do
						expect{
							post :create, project: FactoryBot.attributes_for(:project)
						}.to change(Project, :count).by(1)
					end

					it "rendirects to index path" do
						post :create, project: FactoryBot.attributes_for(:project)
						expect(response).to redirect_to projects_path
					end
				end
			end
		end

	end





