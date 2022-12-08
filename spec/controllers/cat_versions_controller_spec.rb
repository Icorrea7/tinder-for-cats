require "rails_helper"

describe CatVersionsController do
  let!(:cat) do
    create(:cat, name: "felix", last_name: "gato", phone: 658987, status: :single, email: "felix9@gato.com")
  end
  let!(:cat_version) do
    create(:cat_version, name: "michi", cat_id: cat.id)
  end

  describe "#show" do
    it "renders cat versions by id" do
      get :show, params: { id: cat.id }

      expect(response).to have_http_status(:ok)
    end

    it "renders 404 when cat id is not valid" do
      get :show, params: { id: 99 }

      expect(response.status).to eq(404)
    end
  end
end
