# frozen_string_literal: true

require "chartquery"

client = ChartQuery::Client.new # reads CHARTQUERY_API_KEY
begin
  response = client.request("GET", "/v1/usage")
  puts response.data if response.json?
rescue ChartQuery::APIError => e
  warn "HTTP #{e.status}: #{e.message}"
end
