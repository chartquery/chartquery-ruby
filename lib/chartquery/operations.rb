# frozen_string_literal: true

# Generated from the ChartQuery OpenAPI document. Do not edit by hand.

module ChartQuery
  # One method per documented endpoint. Mixed into {Client}.
  module Operations
    # Barcode. Generate a barcode image via GET. Output: SVG (default) or PNG. Supports 25+ formats: EAN-13, Code 128, ITF-14, GS1-128, postal codes and more. Credit cost: 3 credits per call.
    #
    # +GET / POST /v1/barcode+
    #
    # @param data [String] (required) The data to encode in the barcode. Examples by type:
    # @param type [String] Barcode format. Default: code128.
    # @param height [Numeric] Bar height in pixels. Default: 80. Typical values: 50 (compact), 80 (standard), 100–120 (tall labels). Example: ?height=100
    # @param color [String] Bar color as a CSS color string. Default: #000. Examples: ?color=%231e293b (dark slate), ?color=%230f172a (near black), ?color=%237c3aed (purple), ?color=%23dc2626 (red). Use %23 to URL-encode the #…
    # @param show_text [Boolean] Show human-readable text below the bars. Example: ?show_text=true. Combine with font_size and text_align for print labels.
    # @param text_position [String] Position of the human-readable text label. Default: bottom. Example: ?text_position=top
    # @param text_align [String] Horizontal alignment of the text label. Default: center. Example: ?text_align=left
    # @param font_size [Numeric] Font size of the text label in pixels. Default: 14. Example: ?font_size=12
    # @param font_family [String] Font family of the text label. Default: monospace. Examples: ?font_family=monospace, ?font_family=sans-serif, ?font_family=Arial
    # @param bar_width [Numeric] Width multiplier per module (bar). Default: 2. Increase for wider, more scannable barcodes. Example: ?bar_width=3
    # @param bar_gap [Numeric] Extra horizontal spacing between bars in pixels. Default: 0. Example: ?bar_gap=1
    # @param background [String] Background fill color. Default: #fff. Use transparent for no background. Example: ?background=%23f8fafc
    # @param margin [Numeric] Uniform margin around the barcode in pixels. Default: 10. Overridden per side by margin_top/bottom/left/right. Example: ?margin=6
    # @param margin_top [Numeric] Top margin in pixels (overrides margin). Example: ?margin_top=4
    # @param margin_bottom [Numeric] Bottom margin in pixels (overrides margin). Example: ?margin_bottom=4
    # @param margin_left [Numeric] Left margin in pixels (overrides margin). Example: ?margin_left=8
    # @param margin_right [Numeric] Right margin in pixels (overrides margin). Example: ?margin_right=8
    # @param rotation [Numeric] Rotate the barcode by 0, 90, 180 or 270 degrees. Default: 0. Use 90 or 270 for vertical label orientation. Example: ?rotation=90
    # @param bearer_bars [Boolean] Add horizontal bearer bars above and below the barcode. Required for ITF-14. Default: false. Example: ?bearer_bars=true
    # @param unit [String] Measurement unit for dimensions. Default: px. Use mm, in or cm for print-ready output. Example: ?unit=mm
    # @param aria_label [String] Accessible label added as aria-label on the SVG element. Improves screen reader support. Example: ?aria_label=EAN-13+barcode+for+product+4006381333931
    # @param title [String] SVG <title> element for tooltip and accessibility. Example: ?title=Product+Barcode
    # @param desc [String] SVG <desc> element for extended accessibility description. Example: ?desc=EAN-13+encoding+GTIN+for+Nivea+cream+75ml
    # @param format [String] Output format. Default: svg. Use png to get a raster image. SVG is lossless and scalable; PNG is pixel-based and suitable for email, PDF or messaging. Example: ?format=png
    # @param share [Boolean] Set share=true to persist the config and receive JSON instead of an image: { id, render_url, view_url, embed_url, expires_in }. Free plan: 3-day expiry with watermark. Paid plan: 6-month expiry, no b…
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def barcode(request_options: nil, **params)
      call_operation("barcode", params, request_options)
    end

    # Chart. Render a Chart.js image via GET. Pass the full chart object as URL-encoded JSON in query. Prefer format png for ChatGPT. POST sends the same object as a JSON body, not query. Credit cost: 5 credits per call.
    #
    # +GET / POST /v1/chart+
    #
    # @param query [String] (required) Full chart config as URL-encoded JSON. Pass ?version= or ?v= separately to pin the chart version.
    # @param version [String] Chart.js version to use. Alias: ?v=. Only v4.x is supported. Defaults to the installed version (4.5.1). Example: "4", "4.5", "4.5.1". The installed version is always returned in the X-ChartJS-Version…
    # @param share [Boolean] If true, persist the result and return share URLs instead of an image. Leave false to get the image.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def chart(request_options: nil, **params)
      call_operation("chart", params, request_options)
    end

    # Chart AI. Describe a chart in plain English via GET and get a rendered image back. Powered by AI. Credit cost: 10 credits per call.
    #
    # +GET / POST /v1/chart/ai+
    #
    # @param prompt [String] (required) Describe your chart in plain English (max 1000 chars). Be specific: mention chart type, data topic, colors, style.
    # @param raw_data [String] Raw data for the chart. URL-encoded string, CSV, or JSON. AI will parse and structure it.
    # @param title [String] Override the chart title generated by AI.
    # @param subtitle [String] Override the chart subtitle.
    # @param legend [String] Legend position or visibility. Use "false" to hide.
    # @param format [String] Output format. Default: "png".
    # @param width [Numeric] Image width in pixels (50–4000). Default: 1200.
    # @param height [Numeric] Image height in pixels (50–4000). Default: 600.
    # @param background [String] Background color as a hex value. Default: #ffffff.
    # @param device_pixel_ratio [Numeric] Device pixel ratio for the rendered image. Default: 1.
    # @param share [Boolean] Set share=true to persist the config and receive JSON instead of an image: { id, render_url, view_url, embed_url, expires_in }. Free plan: 3-day expiry with watermark. Paid plan: 6-month expiry, no b…
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def chart_ai(request_options: nil, **params)
      call_operation("chart_ai", params, request_options)
    end

    # Chart Render. Render a previously saved chart by ID. Public, no API key required. Supports URL overrides for templates (?data1=, ?labels=, ?title=…).
    #
    # +GET /v1/chart/render/{id}+
    #
    # @param id [String] (required) The chart ID returned in the X-Chart-Render-URL header when saving a chart. Format: cq-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.
    # @param title [String] Override the chart title.
    # @param labels [String] Override X-axis labels. Comma-separated.
    # @param data1 [String] Override first dataset values. Comma-separated numbers. Use data2, data3… for additional datasets.
    # @param width [String] Override output width in pixels (50–4000).
    # @param height [String] Override output height in pixels (50–4000).
    # @param format [String] Override output format.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def chart_render(request_options: nil, **params)
      call_operation("chart_render", params, request_options)
    end

    # Chart View. View a previously saved chart as an interactive HTML page. Public, no API key required. Iframe-embeddable.
    #
    # +GET /v1/chart/view/{id}+
    #
    # @param id [String] (required) The chart ID returned in the X-Chart-View-URL header when saving a chart. Format: cq-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.
    # @param share [Boolean] Set share=true to persist the config and receive JSON instead of an image: { id, render_url, view_url, embed_url, expires_in }. Free plan: 3-day expiry with watermark. Paid plan: 6-month expiry, no b…
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def chart_view(request_options: nil, **params)
      call_operation("chart_view", params, request_options)
    end

    # Diagram. Render a diagram via GET. Use type (mermaid, d2, …), query (source code), and format=png for ChatGPT. POST uses diagram_type and diagram_source instead. Credit cost: 5 credits per call.
    #
    # +GET / POST /v1/diagram+
    #
    # @param type [String] (required) Diagram language.
    # @param query [String] (required) Diagram source code (URL-encoded).
    # @param format [String] Use png so ChatGPT can display the image. svg is for download or infinite scale.
    # @param share [Boolean] If true, persist the result and return share URLs instead of an image. Leave false to get the image.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def diagram(request_options: nil, **params)
      call_operation("diagram", params, request_options)
    end

    # Diagram AI. Describe a diagram in plain English via GET and get a rendered image back. Powered by AI. Credit cost: 10 credits per call.
    #
    # +GET / POST /v1/diagram/ai+
    #
    # @param prompt [String] (required) Describe your diagram in plain English (max 1000 chars). Be specific: mention the diagram type, key entities, and relationships.
    # @param diagram_type [String] Preferred diagram language. AI chooses if omitted. Examples: "mermaid", "d2", "plantuml", "graphviz".
    # @param output_format [String] Output format. Default: "svg".
    # @param share [Boolean] Set share=true to persist the config and receive JSON instead of an image: { id, render_url, view_url, embed_url, expires_in }. Free plan: 3-day expiry. Paid plan: 6-month expiry.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def diagram_ai(request_options: nil, **params)
      call_operation("diagram_ai", params, request_options)
    end

    # Diagram Render. Render a previously saved diagram by ID. Public, no API key required. Supports ?format= and ?query= overrides.
    #
    # +GET /v1/diagram/render/{id}+
    #
    # @param id [String] (required) The diagram ID returned in the X-Diagram-Render-URL header when saving a diagram. Format: cq-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.
    # @param format [String] Override output format.
    # @param query [String] Override the diagram source code (URL-encoded).
    # @param share [Boolean] Set share=true to persist the config and receive JSON instead of an image: { id, render_url, view_url, embed_url, expires_in }. Free plan: 3-day expiry with watermark. Paid plan: 6-month expiry, no b…
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def diagram_render(request_options: nil, **params)
      call_operation("diagram_render", params, request_options)
    end

    # Diagram View. View a previously saved diagram as an HTML page. Public, no API key required. Iframe-embeddable with inline SVG rendering.
    #
    # +GET /v1/diagram/view/{id}+
    #
    # @param id [String] (required) The diagram ID returned in the X-Diagram-View-URL header when saving a diagram. Format: cq-xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx.
    # @param share [Boolean] Set share=true to persist the config and receive JSON instead of an image: { id, render_url, view_url, embed_url, expires_in }. Free plan: 3-day expiry with watermark. Paid plan: 6-month expiry, no b…
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def diagram_view(request_options: nil, **params)
      call_operation("diagram_view", params, request_options)
    end

    # Jobs. Poll the status, progress (0–100) and result of a job started with is_async=true. Polling is free. Poll until status is terminal: CompletedJob, Error, NotFound or BadRequest.
    #
    # +GET /v1/jobs/{id}+
    #
    # @param id [String] (required) The job_id returned by an endpoint called with is_async=true.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def jobs(request_options: nil, **params)
      call_operation("jobs", params, request_options)
    end

    # Label Preview. Preview a thermal label via GET. Pass the same label object as a URL-encoded JSON string in query. Inside that JSON, text items use content and size (1-10), not text or fontSize. Prefer format=png for ChatGPT. Credit cost: 3 credits per call.
    #
    # +GET / POST /v1/label+
    #
    # @param format [String] Use png so ChatGPT can display the image. svg is for download or infinite scale.
    # @param share [Boolean] If true, persist the result and return share URLs instead of an image. Leave false to get the image.
    # @param query [String] (required) Full label config as URL-encoded JSON. Must include width and elements. Text items use content and size (1-10), not text or fontSize.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def label(request_options: nil, **params)
      call_operation("label", params, request_options)
    end

    # Label Compile. Compile a label to printer commands (tsc, zpl, epl, …). POST width, language, and elements. Text uses content and size (1-10), not text or fontSize. No barcode element. Example: {"width":40,"height":30,"unit":"mm","language":"zpl","element… Credit cost: 3 credits per call.
    #
    # +POST /v1/label/compile+
    #
    # @param width [Numeric] (required) Label width. Required. Default unit is mm. Example: 40. Do not send query instead of width.
    # @param height [Numeric] Label height in the same unit. Example: 30. Omit for receipt / continuous mode.
    # @param unit [String] Measurement unit for width and height. Default mm. Use mm unless you are working in printer dots.
    # @param dpi [Numeric] Printer DPI. Default 203.
    # @param gap [Numeric] Gap between labels in mm. Ignored for receipts.
    # @param speed [Numeric] Print speed, 1-18.
    # @param density [Numeric] Print darkness, 0-15.
    # @param direction [Numeric] Print direction. 0 = normal, 1 = reversed.
    # @param copies [Numeric] Number of copies. Minimum 1.
    # @param printer [String] Printer profile id (tsc-te210, zebra-zd420, …).
    # @param elements [Array<Hash>] (required) Required array. Text items need type=text, content, and size (1-10 magnification). Do not use text, fontSize, or type=barcode. Positions x/y are in dots. Example item: {"type":"text","content":"Order…
    # @param language [String] (required) Required printer language. Example: zpl or tsc. Do not omit.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def label_compile(request_options: nil, **params)
      call_operation("label_compile", params, request_options)
    end

    # Label Convert. Convert printer commands from one language to another. POST source, from, and to. from is the source language (tsc, zpl, epl, …). to is the target (tsc, zpl, escpos, …). Credit cost: 5 credits per call.
    #
    # +POST /v1/label/convert+
    #
    # @param source [String] (required) Raw printer commands to convert. Also send from and to.
    # @param from [String] (required) Source language.
    # @param to [String] (required) Target language.
    # @param dpi [Numeric] Override DPI on the converted output.
    # @param speed [Numeric] Override print speed, 1-18.
    # @param density [Numeric] Override print darkness, 0-15.
    # @param copies [Numeric] Override copies. Minimum 1.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def label_convert(request_options: nil, **params)
      call_operation("label_convert", params, request_options)
    end

    # Label Parse. Parse printer commands into structured elements. POST source and language (tsc, zpl, epl, …). Credit cost: 1 credit per call.
    #
    # +POST /v1/label/parse+
    #
    # @param source [String] (required) Raw printer commands to parse. Also send language.
    # @param language [String] (required) Language of the source commands. Example: tsc or zpl.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def label_parse(request_options: nil, **params)
      call_operation("label_parse", params, request_options)
    end

    # Label Render. Render a previously saved label by ID. Public, no API key required. Supports ?format= override.
    #
    # +GET /v1/label/render/{id}+
    #
    # @param id [String] (required)
    # @param format [String] Override output format.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def label_render(request_options: nil, **params)
      call_operation("label_render", params, request_options)
    end

    # Label Validate. Validate printer commands. POST source (the raw commands) and language (tsc, zpl, epl, …). Credit cost: 1 credit per call.
    #
    # +POST /v1/label/validate+
    #
    # @param source [String] (required) Raw printer commands to validate. Also send language.
    # @param language [String] (required) Language of the source commands. Example: tsc or zpl.
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def label_validate(request_options: nil, **params)
      call_operation("label_validate", params, request_options)
    end

    # Label View. View a previously saved label as an HTML page. Public, no API key required. Iframe-embeddable with inline SVG rendering.
    #
    # +GET /v1/label/view/{id}+
    #
    # @param id [String] (required)
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def label_view(request_options: nil, **params)
      call_operation("label_view", params, request_options)
    end

    # QR Code. Generate a styled QR code via GET. Output: SVG (default) or PNG. Supports dot styles, gradients, custom corners and all QR versions. Credit cost: 3 credits per call.
    #
    # +GET / POST /v1/qrcode+
    #
    # @param data [String] (required) Data to encode in the QR code. Examples:
    # @param size [Numeric] Output size in pixels (width = height). Default: 200. Examples: ?size=200 (thumbnail), ?size=300 (standard), ?size=400 (large), ?size=600 (poster). For print, use the unit param with mm/cm instead.
    # @param ec_level [String] Error correction level. Default: M. Higher levels allow more damage/obscuring before the code becomes unreadable.
    # @param dot_type [String] Module (dot) shape. Default: square. Controls the visual style of each QR code module.
    # @param color [String] Module color as CSS hex. Default: #000. Examples: ?color=%236366f1 (indigo), ?color=%23dc2626 (red), ?color=%23059669 (green), ?color=%230891b2 (teal). Use %23 to URL-encode #. For gradient objects,…
    # @param shape [String] Overall QR code shape. Default: square. Use circle to clip the entire QR into a circle: great for profile/avatar-style codes. Example: ?shape=circle&dot_type=dots
    # @param dot_size [Numeric] Module size ratio between 0.1 and 1. Default: 1 (full). Values below 1 add spacing between modules for a lighter look. Example: ?dot_size=0.85
    # @param background [String] Background color. Default: #fff. Set to transparent for no background. Example: ?background=%230f172a for dark background. Use %23 to encode #.
    # @param margin [Numeric] Quiet zone width in modules around the QR code. Default: 4. Minimum recommended by the QR standard: 4. Example: ?margin=2 (compact) or ?margin=6 (extra padding).
    # @param version [Numeric] QR version from 1 to 40 (determines grid size and data capacity). Leave unset for auto-selection based on data length and ec_level. Example: ?version=5
    # @param mode [String] Encoding mode. Default: auto (best mode selected for the data). Use numeric for digits-only, alphanumeric for uppercase + digits, byte for arbitrary text/UTF-8. Example: ?mode=numeric
    # @param mask [Numeric] Mask pattern from 0 to 7. Default: auto (best mask selected to minimize visual patterns). Only set manually if you need a deterministic output. Example: ?mask=3
    # @param unit [String] Measurement unit for the size param. Default: px. Use mm, in or cm with the size param for print-ready output. Example: ?size=50&unit=mm
    # @param xml_declaration [Boolean] Prepend an XML declaration (<?xml version="1.0" encoding="UTF-8"?>) to the SVG output. Useful when the SVG will be used as a standalone XML file. Default: false. Example: ?xml_declaration=true
    # @param aria_label [String] Accessible label added as aria-label on the SVG element. Example: ?aria_label=QR+code+linking+to+chartquery.com
    # @param title [String] SVG <title> element shown as a browser tooltip and used by screen readers. Example: ?title=ChartQuery+Website
    # @param desc [String] SVG <desc> element for extended accessibility description. Example: ?desc=Scan+to+visit+https://chartquery.com
    # @param format [String] Output format. Default: svg. Use png to get a raster image. SVG is lossless and scalable; PNG is pixel-based and suitable for email, PDF or messaging. Example: ?format=png
    # @param share [Boolean] Set share=true to persist the config and receive JSON instead of an image: { id, render_url, view_url, embed_url, expires_in }. Free plan: 3-day expiry with watermark. Paid plan: 6-month expiry, no b…
    # @param fields [String] Comma-separated list of fields to keep in the response, with dot notation for nested fields (e.g. name,location.city). Does not change the credit cost.
    # @param is_async [Boolean] Process the request asynchronously: the response is a job_id to poll on /v1/jobs/{id} (see waitForJob).
    # @param soft_fail [Boolean] Return HTTP 200 even when an error occurs; the error is then in the response body.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse, BinaryResponse]
    def qrcode(request_options: nil, **params)
      call_operation("qrcode", params, request_options)
    end

    # Stats. Infrastructure health for an engine or endpoint over the last hour. Not scoped to your account or tenant. Enabled per account: HTTP 403 means contact support to activate it.
    #
    # +GET /v1/stats+
    #
    # @param engine [String] API family to check, for example chart. Provide at least engine or path.
    # @param path [String] Specific endpoint to check, for example /v1/chart. If you also pass engine, use an endpoint from that API.
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def stats(request_options: nil, **params)
      call_operation("stats", params, request_options)
    end

    # Usage. Return this account's Chartquery usage and credit balance. No body. Requires an API key.
    #
    # +GET /v1/usage+
    #
    # @param request_options [Hash, nil] +:method+ ("GET"/"POST"), +:timeout+ (seconds), +:headers+
    # @return [JsonResponse]
    def usage(request_options: nil, **params)
      call_operation("usage", params, request_options)
    end
  end
end
