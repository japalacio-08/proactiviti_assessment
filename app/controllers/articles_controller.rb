class ArticlesController < ApplicationController

  def index
    search
  end

  def search
    articles = GNews::Finder.new(
      query: params[:query],
      search_by: params[:by],
      num_rows: params[:num_rows],
    ).search

    render json: {
      data: articles
    }
  rescue => e
    render json: {
      errors: e.message
    }
  end
end
