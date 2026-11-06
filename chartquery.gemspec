# frozen_string_literal: true

require_relative "lib/chartquery/version"

Gem::Specification.new do |spec|
  spec.name = "chartquery"
  spec.version = ChartQuery::VERSION
  spec.authors = ["ChartQuery"]
  spec.email = ["contact@chartquery.com"]

  spec.summary = "Official Ruby SDK for the ChartQuery chart and QR code API."
  spec.description = "Generate chart images, diagrams, barcodes, QR codes and thermal labels on demand. PNG, SVG or PDF output."
  spec.homepage = "https://www.chartquery.com"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/chartquery/chartquery-ruby/issues",
    "documentation_uri" => "https://app.chartquery.com/openapi",
    "homepage_uri" => spec.homepage,
    "rubygems_mfa_required" => "true",
    "source_code_uri" => "https://github.com/chartquery/chartquery-ruby"
  }

  spec.files = Dir["LICENSE", "README.md", "examples/**/*", "lib/**/*.rb", "sig/**/*.rbs"]
  spec.require_paths = ["lib"]
end
