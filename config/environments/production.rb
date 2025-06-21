require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.enable_reloading = false
  config.eager_load = true
  config.consider_all_requests_local = false
  config.action_controller.perform_caching = true
  config.public_file_server.headers = { "cache-control" => "public, max-age=#{1.year.to_i}" }
  # config.asset_host = "http://assets.example.com"

  config.active_storage.service = :local
  config.assume_ssl = true
  config.force_ssl = true
  # config.ssl_options = { redirect: { exclude: ->(request) { request.path == "/up" } } }

  config.log_tags = [ :request_id ]
  config.logger = ActiveSupport::TaggedLogging.logger(STDOUT)
  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.silence_healthcheck_path = "/up"

  config.active_support.report_deprecations = false
  config.cache_store = :solid_cache_store

  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to = { database: { writing: :queue } }

  # config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { host: "example.com" }
  # config.action_mailer.smtp_settings = { ... }

  config.i18n.fallbacks = true
  config.active_record.dump_schema_after_migration = false
  config.active_record.attributes_for_inspect = [ :id ]
  # config.hosts = [ ... ]
  # config.host_authorization = { exclude: ->(request) { request.path == "/up" } }

  # Action Cable の Redis 設定
  config.action_cable.url = ENV["REDIS_URL"]
  config.action_cable.allowed_request_origins = [
    /https?:\/\/.*/  # 本番では制限推奨
  ]
end
