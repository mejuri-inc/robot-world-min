class SlackWorker
  include Sidekiq::Worker
  sidekiq_options retry: true

  def self.perform(message)
    hook = ENV['SLACK_WEBHOOK']
    notifier = Slack::Notifier.new hook do
      defaults username: 'Guard bot'
    end

    notifier.post text: message
  end
end
