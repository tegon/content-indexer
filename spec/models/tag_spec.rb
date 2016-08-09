require 'rails_helper'

RSpec.describe Tag do
  before { build(:tag) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:page_id) }
    it { is_expected.to define_enum_for(:type).with([:h1, :h2, :h3]) }
  end

  describe 'associtaions' do
    it { is_expected.to belong_to(:page) }
  end
end
