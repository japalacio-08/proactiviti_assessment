require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  let(:memory_store) { ActiveSupport::Cache.lookup_store(:memory_store) }
  let(:cache) { Rails.cache }

  before do
    allow(Rails).to receive(:cache).and_return(memory_store)
    Rails.cache.clear
  end

  describe "#search" do
    before(:each) do
      stub_const('ENV', 'GNEWS_API_TOKEN' => 'my-token')
    end

    context "when given valid params" do
      let(:query) { "technology" }
      let(:search_by) { "title" }
      let(:num_rows) { 10 }

      before do
        allow_any_instance_of(GNews::Finder).to receive(:search).and_return([])
        get :search, params: { query: query, by: search_by, num_rows: num_rows }
      end

      it "responds with success status" do
        expect(response.status).to eq(200)
      end

      it "renders the articles data in JSON format" do
        expect(JSON.parse(response.body)["data"]).to eq([])
      end
    end

    context "when given invalid params" do
      before do
        allow_any_instance_of(GNews::Finder).to receive(:search).and_raise(GNews::ParamNotFoundException.new('The API key is required.'))
        get :search
      end

      it "renders the error message in JSON format" do
        expect(JSON.parse(response.body)["errors"]).to eq("The API key is required.")
      end
    end

    context "when an error occurs" do
      before do
        allow_any_instance_of(GNews::Finder).to receive(:search).and_raise(StandardError.new('An error occurred while fetching articles.'))
        get :search, params: { query: "technology", by: "title", num_rows: 10 }
      end

      it "renders the error message in JSON format" do
        expect(JSON.parse(response.body)["errors"]).to eq("An error occurred while fetching articles.")
      end
    end
  end
end
