# frozen_string_literal: true

require "chartquery"

client = ChartQuery::Client.new # reads CHARTQUERY_API_KEY
submitted = client.chart_ai(prompt: "Monthly revenue 2026 as a bar chart: Jan 10, Feb 14, Mar 18", is_async: true)
job = client.wait_for_job(submitted.data["job_id"]) { |j| puts "#{j['status']} #{j['progress']}%" }
puts job.data
