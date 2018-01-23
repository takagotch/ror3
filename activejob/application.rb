Rails.application.config.active_job_adapter = :sidekiq

module MyApp
  class Applicatoin < Rails::Application
    config.active_job.queue_name_prefix = Rails.env
  end
end

MyJob.set(queue: :another_queue).perform_later(record)


