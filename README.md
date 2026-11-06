# ChartQuery Ruby SDK

The official Ruby SDK for the [ChartQuery](https://www.chartquery.com) chart and QR code API.

Generate chart images, diagrams, barcodes, QR codes and thermal labels on demand. PNG, SVG or PDF output.

The SDK exposes **20 methods**, one per documented endpoint, plus a generic `request`. It only uses the Ruby standard library.

## Requirements

- Ruby 3.1 or newer

## Installation

```sh
gem install chartquery
```

Or in your `Gemfile`:

```ruby
gem "chartquery"
```

## Get your API key

[Sign up for ChartQuery](https://app.chartquery.com/register) or sign in, then copy your API key from the [dashboard](https://app.chartquery.com). The client reads `ENV["CHARTQUERY_API_KEY"]` when no key is passed.

## Quick start

```ruby
require "chartquery"

client = ChartQuery::Client.new(api_key: ENV.fetch("CHARTQUERY_API_KEY"))
response = client.chart_ai(prompt: "Monthly revenue 2026 as a bar chart: Jan 10, Feb 14, Mar 18")
puts response.data
```

Keyword arguments use the parameter names of the [API reference](https://app.chartquery.com/openapi). Unknown names raise `ChartQuery::SerializationError`; use `request` for undocumented parameters.

## Binary responses

Endpoints that can return a file (image, PDF…) return a `JsonResponse` or a `BinaryResponse`:

```ruby
response = client.qrcode(data: "https://chartquery.com", format: "png")
response.save("qrcode.png") if response.binary?
```

## Async jobs

Any call accepts `is_async: true` (useful past the 60-second server limit): the response is then a `job_id`. `wait_for_job` polls `GET /v1/jobs/{id}` until a terminal status (`CompletedJob`, `Error`, `NotFound`, `BadRequest`):

```ruby
submitted = client.chart_ai(prompt: "Monthly revenue 2026 as a bar chart: Jan 10, Feb 14, Mar 18", is_async: true)
job = client.wait_for_job(submitted.data["job_id"]) { |j| puts "#{j['status']} #{j['progress']}%" }
puts job.data
```

## GET or POST

Methods use GET when the endpoint supports it (query string). POST sends the same parameters as JSON:

```ruby
client.barcode(data: "test", request_options: { method: "POST" })
```

`nil` values are omitted, `false` and `0` are sent, and arrays repeat the parameter name.

## Any endpoint

```ruby
response = client.request("GET", "/v1/usage")
```

## Errors

```ruby
begin
  client.chart_ai(prompt: "Monthly revenue 2026 as a bar chart: Jan 10, Feb 14, Mar 18")
rescue ChartQuery::APIError => e
  warn "HTTP #{e.status}: #{e.message}"
end
```

| Error | When |
| --- | --- |
| `ChartQuery::ConfigurationError` | Missing API key, invalid options or unsupported method. |
| `ChartQuery::SerializationError` | A required parameter is missing, unknown or can't be sent. |
| `ChartQuery::TransportError` | Network failure or timeout. |
| `ChartQuery::APIError` | Non-2xx status (`status`, `error_message`, `response_body`, `raw_response`). |
| `ChartQuery::ResponseDecodingError` | A success response could not be decoded. |

All of them inherit from `ChartQuery::Error`.

## Retries

Requests are retried up to 3 times after a network error, a `408`, `500`, `502`, `503` or `504`, or a rate limit — which the API returns as `401` (or `429`) with a `Rate limit exceeded` message. Per-key quota errors (`…: quota daily`) are not retried, nor are `400`, `402`, `404` or client-side timeouts. The delay starts at 1 second and grows 1.5× per retry (capped at 30 seconds); a `Retry-After` header wins.

```ruby
client = ChartQuery::Client.new(max_retries: 5, retry_delay: 0.5)
client.chart_ai(prompt: "Monthly revenue 2026 as a bar chart: Jan 10, Feb 14, Mar 18", request_options: { max_retries: 0 }) # one request without retries
```

## Batch requests

`batch` runs the block for every item on 10 threads (`concurrency:`) and returns one `BatchResult` per item, in input order. A failing item never stops the others.

```ruby
inputs = ["Monthly revenue 2026 as a bar chart: Jan 10, Feb 14, Mar 18", "Market share as a pie chart: A 40, B 35, C 25"]
results = client.batch(inputs, concurrency: 5) { |value| client.chart_ai(prompt: value) }
results.each do |result|
  if result.ok?
    puts result.value.data
  else
    warn "#{inputs[result.index]}: #{result.error.message}"
  end
end
```

| Constant | Default | Description |
| --- | --- | --- |
| `ChartQuery::Client::DEFAULT_CONCURRENCY` | `10` | Tasks run at the same time by batch |
| `ChartQuery::Client::DEFAULT_TIMEOUT` | `120` | Request timeout (seconds) |
| `ChartQuery::Client::MAX_RETRIES` | `3` | Retry attempts after a network error, a 408/5xx or a rate limit |
| `ChartQuery::Client::RETRY_BACKOFF_FACTOR` | `1.5` | Exponential backoff multiplier |
| `ChartQuery::Client::DEFAULT_RETRY_DELAY` | `1.0` | Delay before the first retry (seconds) |

## Timeouts and custom transports

```ruby
client = ChartQuery::Client.new(timeout: 60) # seconds, default 120
client.chart_ai(prompt: "Monthly revenue 2026 as a bar chart: Jan 10, Feb 14, Mar 18", request_options: { timeout: 30 })
```

A transport is any object with `call(method:, url:, headers:, body:, timeout:)` returning `[status, headers, body]`; the default is `ChartQuery::NetHTTPTransport`.

## Endpoints

20 methods, generated from the [OpenAPI document](https://app.chartquery.com/openapi).

| Method | HTTP | Description |
| --- | --- | --- |
| `barcode` | GET / POST `/v1/barcode` | Generate a barcode image via GET. Output: SVG (default) or PNG. Supports 25+ formats: EAN-13, Code 128, ITF-14, GS1-128, postal codes and m… |
| `chart` | GET / POST `/v1/chart` | Render a Chart.js image via GET. Pass the full chart object as URL-encoded JSON in query. Prefer format png for ChatGPT. POST sends the sam… |
| `chart_ai` | GET / POST `/v1/chart/ai` | Describe a chart in plain English via GET and get a rendered image back. Powered by AI. |
| `chart_render` | GET `/v1/chart/render/{id}` | Render a previously saved chart by ID. Public, no API key required. Supports URL overrides for templates (?data1=, ?labels=, ?title=…). |
| `chart_view` | GET `/v1/chart/view/{id}` | View a previously saved chart as an interactive HTML page. Public, no API key required. Iframe-embeddable. |
| `diagram` | GET / POST `/v1/diagram` | Render a diagram via GET. Use type (mermaid, d2, …), query (source code), and format=png for ChatGPT. POST uses diagram_type and diagram_so… |
| `diagram_ai` | GET / POST `/v1/diagram/ai` | Describe a diagram in plain English via GET and get a rendered image back. Powered by AI. |
| `diagram_render` | GET `/v1/diagram/render/{id}` | Render a previously saved diagram by ID. Public, no API key required. Supports ?format= and ?query= overrides. |
| `diagram_view` | GET `/v1/diagram/view/{id}` | View a previously saved diagram as an HTML page. Public, no API key required. Iframe-embeddable with inline SVG rendering. |
| `jobs` | GET `/v1/jobs/{id}` | Poll the status, progress (0–100) and result of a job started with is_async=true. Polling is free. Poll until status is terminal: Completed… |
| `label` | GET / POST `/v1/label` | Preview a thermal label via GET. Pass the same label object as a URL-encoded JSON string in query. Inside that JSON, text items use content… |
| `label_compile` | POST `/v1/label/compile` | Compile a label to printer commands (tsc, zpl, epl, …). POST width, language, and elements. Text uses content and size (1-10), not text or… |
| `label_convert` | POST `/v1/label/convert` | Convert printer commands from one language to another. POST source, from, and to. from is the source language (tsc, zpl, epl, …). to is the… |
| `label_parse` | POST `/v1/label/parse` | Parse printer commands into structured elements. POST source and language (tsc, zpl, epl, …). |
| `label_render` | GET `/v1/label/render/{id}` | Render a previously saved label by ID. Public, no API key required. Supports ?format= override. |
| `label_validate` | POST `/v1/label/validate` | Validate printer commands. POST source (the raw commands) and language (tsc, zpl, epl, …). |
| `label_view` | GET `/v1/label/view/{id}` | View a previously saved label as an HTML page. Public, no API key required. Iframe-embeddable with inline SVG rendering. |
| `qrcode` | GET / POST `/v1/qrcode` | Generate a styled QR code via GET. Output: SVG (default) or PNG. Supports dot styles, gradients, custom corners and all QR versions. |
| `stats` | GET `/v1/stats` | Infrastructure health for an engine or endpoint over the last hour. Not scoped to your account or tenant. Enabled per account: HTTP 403 mea… |
| `usage` | GET `/v1/usage` | Return this account's Chartquery usage and credit balance. No body. Requires an API key. |

## All ChartQuery SDKs

| SDK | Package | Install |
| --- | --- | --- |
| Node.js | [`@chartquery/sdk`](https://www.npmjs.com/package/@chartquery/sdk) | `npm install @chartquery/sdk` |
| Python | [`chartquery`](https://pypi.org/project/chartquery/) | `pip install chartquery` |
| Go | [`chartquery-go`](https://pkg.go.dev/github.com/chartquery/chartquery-go) | `go get github.com/chartquery/chartquery-go` |
| .NET | [`ChartQuery`](https://www.nuget.org/packages/ChartQuery) | `dotnet add package ChartQuery` |
| Ruby | [`chartquery`](https://rubygems.org/gems/chartquery) | `gem install chartquery` |
| PHP | [`chartquery/sdk`](https://packagist.org/packages/chartquery/sdk) | `composer require chartquery/sdk` |
| Java | [`chartquery-java`](https://github.com/chartquery/chartquery-java) | build from source, see its README |
| CLI | [`@chartquery/cli`](https://www.npmjs.com/package/@chartquery/cli) | `npm install -g @chartquery/cli` |
| MCP server | [`@chartquery/mcp`](https://www.npmjs.com/package/@chartquery/mcp) | `npx -y @chartquery/mcp` |

## License

MIT — see [LICENSE](LICENSE).
