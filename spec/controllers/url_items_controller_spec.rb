require 'rails_helper'

RSpec.describe UrlItemsController, type: :controller do
  describe "GET #index" do
    it 'return response status 200' do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe "POST #create" do
    it 'creates new url' do
      expect do
        post :create, params: { url: "https://google.com" }
      end.to change(UrlItem, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    let!(:record) { create :url_item }

    it 'deletes url by id' do
      expect do
        delete :destroy, params: { id: record.id }
      end.to change(UrlItem, :count).by(-1)
    end
  end
end
