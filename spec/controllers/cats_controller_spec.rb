require "rails_helper"

describe CatsController do
  let!(:cat) do
    create(:cat, name: "felix", last_name: "gato", phone: 658987, status: :single, email: "felix9@gato.com")
  end

  describe "#index" do
    it "renders the cats in database" do
      get :index

      expect(response).to have_http_status(:ok)
      expect(assigns(:cats)).to eq([cat])
    end
  end

  describe "#show" do
    it "renders cat info view" do
      get :show, params: { id: cat.id }

      expect(response).to have_http_status(:ok)
    end

    it "renders 404 when cat id is not valid" do
      get :show, params: { id: 99 }

      expect(response.status).to eq(404)
    end
  end

  describe "#create" do
    it "creates a successful a new cat" do
      params = { name: "gatito", last_name: "gato", status: :single, email: "gatito@gato.com" }
      cat = Cat.create(params)

      expect(cat).to be_an_instance_of(Cat)
      expect(cat.id).to be_present
    end

    it "render error creating a new cat" do
      post :create, body: {}

      expect(response).to have_http_status(302)
    end
  end

  describe "#destroy" do
    it "destroy a successful a cat" do
      params = { id: cat.id }

      expect { post :destroy, params: params, as: :json }.to change(Cat, :count).by(-1)
    end

    it "render error destroying a cat" do
      expect { post :destroy, params: { id: 99 }, as: :json }.not_to change(Cat, :count)
    end
  end
end
