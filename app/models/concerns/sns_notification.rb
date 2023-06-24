module SnsNotification
  extend ActiveSupport::Concern

  included do
    after_create :send_notification
  end

  private

  def send_notification
    sns_client = Aws::SNS::Client.new
    topic_arn = ENV['AWS_SNS_TOPIC_ARN']
    message = generate_notification_message
    sns_client.publish(topic_arn: topic_arn, message: message)
  end

  def generate_notification_message
    raise NotImplementedError, "The #{self.class.name} model must implement the generate_notification_message method"
  end
end
