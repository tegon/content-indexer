require 'rails_helper'

RSpec.describe PagesController do
  describe 'GET index' do
    it 'does respond with 200 OK' do
      pages = create_list(:page, 2)

      get :index

      expect(response).to be_success
    end
  end

  describe 'GET show' do
    it 'does respond with 200 OK' do
      page = create(:page)

      get :show, params: { id: page.id }

      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it 'does respond with 200 OK' do
      document = Nokogiri::HTML(open(File.expand_path("../../support/html/tegon.html", __FILE__)))
      allow_any_instance_of(Crawler).to receive(:document).and_return(document)
      page_params = { url: 'https://tegon.github.io' }

      expect { post :create, params: { page: page_params } }.to change{ Page.count }.by(1)

      expect(response).to be_success
    end
  end
end
