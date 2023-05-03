module GNews
  class ParamNotFoundException < StandardError; end

  include HTTParty

  class Finder

    CACHE_KEY_PREFFIX = "g_news:api:articles:"
    API_URL = 'https://gnews.io/api/v4/search'
    DEFAULT_MAX_ROWS = 5
    SPECIFIC_SEARCH_MAPPING = {
      'title' => 'title',
      'author' => 'source.name'
    }

    def initialize(query: , search_by:, num_rows:)
      @token = ENV['GNEWS_API_TOKEN']
      raise ParamNotFoundException, 'The API key is required.' if @token.blank?
      @query = query || 'None'
      @search_by = search_by
      @num_rows = num_rows
    end

    def search(use_cache: true)
      fetch_articles(use_cache: use_cache)
    end

    def query_params
      {
        token: @token, lang: 'en',
        q: @query || '',
        in: SPECIFIC_SEARCH_MAPPING[@search_by],
        max: @num_rows.to_i || DEFAULT_MAX_ROWS
      }
    end

    private

    def search_by_title_or_author
      @query.gsub(' ', ' AND ') if @search_by.present? && (
        @search_by.in? SPECIFIC_SEARCH_MAPPING.keys
      )

      @query
    end

    def fetch_articles(use_cache:)
      cached = cached_response(key: cache_key)

      return parse_cached_answer(answer: cached) if cached.present? && use_cache


      response = HTTParty.get(
        API_URL,
        query: query_params
      )
      articles = response.parsed_response['articles']
      write_cache(articles.to_json)

      articles
    end

    def write_cache(json_data)
      Rails.cache.write(cache_key, json_data, expires_in: 5.minutes)
    end

    def parse_cached_answer(answer:)
      JSON.parse(answer)
    end

    def cached_response(key:)
      Rails.cache.read(key)
    end

    def cache_key
      "#{CACHE_KEY_PREFFIX}#{query_params.to_s}"
    end
  end
end
