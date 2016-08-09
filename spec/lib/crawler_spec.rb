require 'rails_helper'

RSpec.describe Crawler do
  describe '#initialize' do
    it 'sets url accessor' do
      crawler = Crawler.new('https://tegon.github.io')
      expect(crawler.url).to eq('https://tegon.github.io')
    end
  end

  describe '#links' do
    it 'returns page links' do
      crawler = Crawler.new('https://tegon.github.io')
      document = Nokogiri::HTML(open(File.expand_path("../../support/html/tegon.html", __FILE__)))
      allow(crawler).to receive(:document).and_return(document)
      expected_links = [
        {:href=>"https://github.com/tegon"},
        {:href=>"https://br.linkedin.com/in/tegon"},
        {:href=>"https://twitter.com/tegonl"},
        {:href=>"https://play.google.com/store/apps/dev?id=7812285483653318759"},
        {:href=>"http://www.clickjogos.com.br"},
        {:href=>"http://www.jogosdemeninas.com.br"},
        {:href=>"http://www.joguinhos.com.br"},
        {:href=>"http://www.minhaserie.com.br/"},
        {:href=>"https://www.carrinhoemcasa.com.br/"},
        {:href=>"https://play.google.com/store/apps/details?id=br.com.clickjogos"},
        {:href=>"https://github.com/tegon/traktflix"},
        {:href=>"https://github.com/tegon/clone-org-repos"},
        {:href=>"https://github.com/tegon/cineminha-bot"},
        {:href=>"https://github.com/tegon/TrucoMarreco"},
        {:href=>"https://github.com/little-dice-games/velha-mania"}
      ]

      expect(crawler.links).to eq(expected_links)
    end
  end

  describe '#tags' do
    it 'returns page h1, h2 and h3 tags' do
      crawler = Crawler.new('https://tegon.github.io')
      document = Nokogiri::HTML(open(File.expand_path("../../support/html/tegon.html", __FILE__)))
      allow(crawler).to receive(:document).and_return(document)
      expected_tags = [
        {:type=>"h1", :content=>"Leonardo Tegon"},
        {:type=>"h2", :content=>"Work"},
        {:type=>"h2", :content=>"Open Source"},
        {:type=>"h3", :content=>"Click Jogos"},
        {:type=>"h3", :content=>"Jogos de Meninas"},
        {:type=>"h3", :content=>"Joguinhos"},
        {:type=>"h3", :content=>"Minha Série"},
        {:type=>"h3", :content=>"Carrinho em Casa"},
        {:type=>"h3", :content=>"Click Jogos Android"},
        {:type=>"h3", :content=>"traktflix"},
        {:type=>"h3", :content=>"clone-org-repos"},
        {:type=>"h3", :content=>"cineminha-bot"},
        {:type=>"h3", :content=>"TrucoMarreco"},
        {:type=>"h3", :content=>"velha-mania"}
      ]

      expect(crawler.tags).to eq(expected_tags)
    end
  end
end
