# frozen_string_literal: true

require "chartquery"

client = ChartQuery::Client.new # reads CHARTQUERY_API_KEY
response = client.qrcode(data: "https://chartquery.com", format: "png")
if response.binary?
  response.save("qrcode.png")
  puts "Saved qrcode.png (#{response.content_type}, #{response.bytes.bytesize} bytes)"
else
  puts response.data
end
