require 'rails_helper'

RSpec.describe CatVersion, type: :model do
  describe "ActiveRecord associations" do
    it { is_expected.to belong_to(:cat) }
  end
end
