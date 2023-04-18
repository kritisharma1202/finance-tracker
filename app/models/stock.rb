class Stock < ApplicationRecord

  def self.new_lookup(ticker_symbol)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publishable_token_key],
      secret_token: Rails.application.credentials.iex_client[:secret_token_key],
      endpoint: 'https://cloud.iexapis.com/v1'
    )
    return client.quote(ticker_symbol).latest_price
  end
end
