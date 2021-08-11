require 'rails_helper'

RSpec.describe "Cherries", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/cherry/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/cherry/show"
      expect(response).to have_http_status(:success)
    end
  end

end
