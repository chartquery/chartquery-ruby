# frozen_string_literal: true

require "json"
require "chartquery"

client = ChartQuery::Client.new # reads CHARTQUERY_API_KEY
response = client.chart_ai(prompt: "Monthly revenue 2026 as a bar chart: Jan 10, Feb 14, Mar 18")
puts JSON.pretty_generate(response.data)
