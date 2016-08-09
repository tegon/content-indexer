require 'rails_helper'

RSpec.describe Link do
  before { build(:link) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:href) }
    it { is_expected.to validate_presence_of(:page_id) }
    it { is_expected.to allow_value('https://google.com').for(:href) }
    it { is_expected.to_not allow_value('google.com').for(:href) }
  end

  describe 'associtaions' do
    it { is_expected.to belong_to(:page) }
  end
end
