Sentry.init do |config|
    config.dsn = 'https://3227dae830c54d638b70d6761b677d60@o4504352699449344.ingest.sentry.io/4504352705806336'
    config.breadcrumbs_logger = [:active_support_logger, :http_logger]
  
    # Set traces_sample_rate to 1.0 to capture 100%
    # of transactions for performance monitoring.
    # We recommend adjusting this value in production.
    config.traces_sample_rate = 1.0
    # or
    config.traces_sampler = lambda do |context|
      true
    end
  end