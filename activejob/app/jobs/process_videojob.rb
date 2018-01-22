class ProcessVideoJob < ActiveJob::Base
  queue_as do
    video = self.arguments.first
    if video.owner.premium?
      :premium_videojobs
    end
  end

  def perform(video)
    #do process video
  end
end

ProcessVideoJob.perform_later(Video.last)

