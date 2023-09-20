require 'rails_helper'

RSpec.describe PrismsController, type: :controller do

  describe "prism#edit action" do
    it "should successfully open edit page if the prism is found" do
      user = FactoryBot.create(:user)
      sign_in user

      garden = FactoryBot.create(:garden)
      prism = FactoryBot.create(:garden)
      get :edit, params: { id: garden.prisms.ids }
      expect(response).to have_http_status(:success)
    end
  end

  describe "prism#show action" do
    it "should successfully show the page if the prism is found" do
      user = FactoryBot.create(:user)
      sign_in user

      garden = FactoryBot.create(:garden)
      prism = FactoryBot.create(:garden)
      get :show, params: { id: prism.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the prism is not found" do
      user = FactoryBot.create(:user)
      sign_in user
      get :show, params: { id: 'TACOCAT' }
      expect(response).to have_http_status(:not_found)
    end
  end
end
