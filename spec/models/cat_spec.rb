require 'rails_helper'

RSpec.describe Cat, type: :model do
  describe "Enums" do
    it { is_expected.to define_enum_for(:status).with_values([:single, :open_relationship, :just_friendship]) }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to allow_value("single", "open_relationship").for(:status) }
  end

  context "Create a cat" do
    let(:cat) { create(:cat, name: "felix", last_name: "gato", phone: 658987, status: :single, email: "felix9@gato.com") }

    describe "with valid attributes" do
      it "should be a valid record" do
        expect(cat).to be_valid
        expect(cat.errors).to be_empty
      end

      it "should save email in lower case" do
        cat.email = "CAT@NACIONAL.COM"
        cat.save
        expect(cat.email).to eq("cat@nacional.com")
      end

      it "should set values" do
        cat.save
        expect(cat.name).to eq("felix")
        expect(cat.last_name).to eq("gato")
        expect(cat.phone).to eq("658987")
        expect(cat.status).to eq('single')
      end
    end

    describe "with invalid attributes" do
      it "should validates presence of email" do
        cat.email = nil
        expect(cat).not_to be_valid
        expect(cat.errors).not_to be_empty
        expect(cat.errors).to include(:email)
      end

      it "should validates presence of email" do
        cat.name = nil
        expect(cat).not_to be_valid
        expect(cat.errors).not_to be_empty
        expect(cat.errors).to include(:name)
      end
    end
  end

  context "Update a cat" do
    let(:cat) { create(:cat, name: "felix", last_name: "gato", phone: 658987, status: :single, email: "felix9@gato.com") }

    describe "with valid attributes" do
      it "updates cat params" do
        new_params = { name: "Figaro", email: "figaro@gato.com" }
        cat.update(new_params)

        cat.reload
        expect(cat.name).to eq("Figaro")
        expect(cat.email).to eq("figaro@gato.com")
      end
    end
  end
end
