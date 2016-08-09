require 'rails_helper'

RSpec.describe Page do
  before { build(:page) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:url) }
    it { is_expected.to allow_value('https://tegon.github.io').for(:url) }
    it { is_expected.to_not allow_value('tegon.github.io').for(:url) }
  end

  describe 'associtaions' do
    it { is_expected.to have_many(:tags) }
    it { is_expected.to have_many(:links) }
  end
end
