require 'rails_helper'

RSpec.describe GNews::Finder do
  let(:query) { 'covid' }
  let(:search_by) { 'title' }
  let(:num_rows) { 10 }
  let(:token) { 'my-token' }
  let(:cache_key) { "g_news:api:articles:{:token=>\"my-token\", :lang=>\"en\", :q=>\"covid\", :in=>\"title\", :max=>10}" }
  let(:articles) do
    [      { title: 'Covid is spreading', author: 'John Doe' },      { title: 'New measures to contain Covid', author: 'Jane Smith' }    ]
  end
  let(:response) { { 'articles' => articles } }

  let(:memory_store) { ActiveSupport::Cache.lookup_store(:memory_store) }
  let(:cache) { Rails.cache }

  before do
    allow(Rails).to receive(:cache).and_return(memory_store)
    Rails.cache.clear
  end

  describe '#initialize' do
    context 'with missing token' do
      it 'raises an error' do
        expect {
          described_class.new(query: query, search_by: search_by, num_rows: num_rows)
        }.to raise_error(GNews::ParamNotFoundException, 'The API key is required.')
      end
    end

    context 'with all required parameters' do
      before(:each) do
        stub_const('ENV', 'GNEWS_API_TOKEN' => 'my-token')
      end
      subject { described_class.new(query: query, search_by: search_by, num_rows: num_rows) }

      it 'sets instance variables' do
        expect(subject.instance_variable_get(:@query)).to eq(query)
        expect(subject.instance_variable_get(:@search_by)).to eq(search_by)
        expect(subject.instance_variable_get(:@num_rows)).to eq(num_rows)
      end
    end
  end

  describe '#query_params' do
    before(:each) do
      stub_const('ENV', 'GNEWS_API_TOKEN' => 'my-token')
    end
    subject { described_class.new(query: query, search_by: search_by, num_rows: num_rows).query_params }

    it 'returns a hash of query parameters' do
      expect(subject).to eq({
        token: token,
        lang: 'en',
        q: query,
        in: 'title',
        max: num_rows
      })
    end

    context 'with search_by = author' do
      let(:search_by) { 'author' }

      it 'sets "in" query param to "source.name"' do
        expect(subject).to include(in: 'source.name')
      end
    end
  end

  describe '#search' do
    before(:each) do
      stub_const('ENV', 'GNEWS_API_TOKEN' => 'my-token')
    end
    subject { described_class.new(query: query, search_by: search_by, num_rows: num_rows) }

    context 'when cache is not used' do
      before do
        Rails.cache.clear
        allow(HTTParty).to receive(:get).and_return(double(parsed_response: response))
      end

      it 'fetches articles from the API' do
        expect(subject.search).to eq(articles)
      end

      it 'writes articles to cache' do
        expect(Rails.cache).to receive(:write).with(cache_key, articles.to_json, expires_in: 5.minutes)
        subject.search
      end
    end

    context 'when cache is used' do
      before do
        Rails.cache.write(cache_key, articles.to_json, expires_in: 5.minutes)
      end

      it 'fetches articles from cache' do
        expect(subject.search).to eq(articles.as_json)
      end

      it 'does not fetch articles from the API' do
        expect(HTTParty).not_to receive(:get)
        subject.search
      end
    end
  end
end
