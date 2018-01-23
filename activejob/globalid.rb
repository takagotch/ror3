#deserialize1
class TrashableCleanupJob
  def perform(trashasble_class, tranhable_id, depth)
    trasable = transhable_class.constatize.find(trashable_id)
    trashable.cleanup(depth)
  end
end

#deserialize2
#ActiveModle::GlobalIdentification
class TrashableCleanupCleanupJob
  def perform(transhable, depth)
    trashable.cleanup(depth)
  end
end

#rescue
class GuestCleanupJob < ActiveJob::Base
  queue_as :default

  rescue_form(AcitveRecord::RecordNotFound) do |exception|
  end
  
  def perform
  end
end

#ActionMailer
UserMailer.welcome(@user).deliver_now
UserMailer.welcome(@user).deliver_later

#callback
class GuessCleanupJob < ActiveJob::Base
  queue_as :default

  before_enqueue do |job|
    block.call
  end

  def perform
  end
end
#before_enqueue
#around_enqueue
#after_enqueue
#before_perform
#around_perform
#after_perform

#queue

#job





