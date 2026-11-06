# frozen_string_literal: true

# Generated from the ChartQuery OpenAPI document. Do not edit by hand.

module ChartQuery
  # Path, methods, response kind and parameter names of every documented operation.
  ENDPOINTS = {
    "barcode" => {
      path: "/v1/barcode",
      methods: ["GET", "POST"].freeze,
      response: :any,
      required: ["data"].freeze,
      params: ["data", "type", "height", "color", "show_text", "text_position", "text_align", "font_size", "font_family", "bar_width", "bar_gap", "background", "margin", "margin_top", "margin_bottom", "margin_left", "margin_right", "rotation", "bearer_bars", "unit", "aria_label", "title", "desc", "format", "share", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "chart" => {
      path: "/v1/chart",
      methods: ["GET", "POST"].freeze,
      response: :any,
      required: ["query"].freeze,
      params: ["query", "version", "share", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "chart_ai" => {
      path: "/v1/chart/ai",
      methods: ["GET", "POST"].freeze,
      response: :json,
      required: ["prompt"].freeze,
      params: ["prompt", "raw_data", "title", "subtitle", "legend", "format", "width", "height", "background", "device_pixel_ratio", "share", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "chart_render" => {
      path: "/v1/chart/render/{id}",
      methods: ["GET"].freeze,
      response: :any,
      required: ["id"].freeze,
      params: ["id", "title", "labels", "data1", "width", "height", "format", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "chart_view" => {
      path: "/v1/chart/view/{id}",
      methods: ["GET"].freeze,
      response: :json,
      required: ["id"].freeze,
      params: ["id", "share", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "diagram" => {
      path: "/v1/diagram",
      methods: ["GET", "POST"].freeze,
      response: :any,
      required: ["type", "query"].freeze,
      params: ["type", "query", "format", "share", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "diagram_ai" => {
      path: "/v1/diagram/ai",
      methods: ["GET", "POST"].freeze,
      response: :json,
      required: ["prompt"].freeze,
      params: ["prompt", "diagram_type", "output_format", "share", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "diagram_render" => {
      path: "/v1/diagram/render/{id}",
      methods: ["GET"].freeze,
      response: :any,
      required: ["id"].freeze,
      params: ["id", "format", "query", "share", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "diagram_view" => {
      path: "/v1/diagram/view/{id}",
      methods: ["GET"].freeze,
      response: :json,
      required: ["id"].freeze,
      params: ["id", "share", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "jobs" => {
      path: "/v1/jobs/{id}",
      methods: ["GET"].freeze,
      response: :json,
      required: ["id"].freeze,
      params: ["id"].freeze
    }.freeze,
    "label" => {
      path: "/v1/label",
      methods: ["GET", "POST"].freeze,
      response: :any,
      required: ["query"].freeze,
      params: ["format", "share", "query", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "label_compile" => {
      path: "/v1/label/compile",
      methods: ["POST"].freeze,
      response: :json,
      required: ["width", "elements", "language"].freeze,
      params: ["width", "height", "unit", "dpi", "gap", "speed", "density", "direction", "copies", "printer", "elements", "language", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "label_convert" => {
      path: "/v1/label/convert",
      methods: ["POST"].freeze,
      response: :json,
      required: ["source", "from", "to"].freeze,
      params: ["source", "from", "to", "dpi", "speed", "density", "copies", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "label_parse" => {
      path: "/v1/label/parse",
      methods: ["POST"].freeze,
      response: :json,
      required: ["source", "language"].freeze,
      params: ["source", "language", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "label_render" => {
      path: "/v1/label/render/{id}",
      methods: ["GET"].freeze,
      response: :any,
      required: ["id"].freeze,
      params: ["id", "format", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "label_validate" => {
      path: "/v1/label/validate",
      methods: ["POST"].freeze,
      response: :json,
      required: ["source", "language"].freeze,
      params: ["source", "language", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "label_view" => {
      path: "/v1/label/view/{id}",
      methods: ["GET"].freeze,
      response: :json,
      required: ["id"].freeze,
      params: ["id", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "qrcode" => {
      path: "/v1/qrcode",
      methods: ["GET", "POST"].freeze,
      response: :any,
      required: ["data"].freeze,
      params: ["data", "size", "ec_level", "dot_type", "color", "shape", "dot_size", "background", "margin", "version", "mode", "mask", "unit", "xml_declaration", "aria_label", "title", "desc", "format", "share", "fields", "is_async", "soft_fail"].freeze
    }.freeze,
    "stats" => {
      path: "/v1/stats",
      methods: ["GET"].freeze,
      response: :json,
      required: [].freeze,
      params: ["engine", "path"].freeze
    }.freeze,
    "usage" => {
      path: "/v1/usage",
      methods: ["GET"].freeze,
      response: :json,
      required: [].freeze,
      params: [].freeze
    }.freeze
  }.freeze
end
