# Do not inherit from ActiveJob. All jobs use Sidekiq
class ApplicationJob
  include Sidekiq::Job

  sidekiq_options backtrace: true
end
