class GuestsCleanupJob < ActiveJob::Base
  queue_as :default
  queue_as :low_priotiry

  def perfom(*args)
  end
end

GuestsCleanupJob.perform_later guest
GuestsCleanupJob.set(wait: 1.week).perform_later(guest)
GuestsCleanupJob.perform_later(guest1, guest2, filter: 'some_filter')




