require 'rails_helper'

RSpec.describe "Admin::Whiskies", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/admin/whiskies/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /delete" do
    it "returns http success" do
      get "/admin/whiskies/delete"
      expect(response).to have_http_status(:success)
    end
  end

end
