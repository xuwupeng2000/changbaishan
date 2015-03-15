require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe "GET #welcom" do
    it "returns http success" do
      get :welcom
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #user_agreement" do
    it "returns http success" do
      get :user_agreement
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #question_and_answers" do
    it "returns http success" do
      get :question_and_answers
      expect(response).to have_http_status(:success)
    end
  end

end
