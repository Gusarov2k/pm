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
		end

	end





