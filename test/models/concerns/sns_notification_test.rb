require 'test_helper'

class SnsNotificationTest < ActiveSupport::TestCase
  # Define a dummy model that includes the concern for testing
  class DummyModel
    include ActiveModel::Model
    include SnsNotification

    attr_accessor :title

    def save
      run_callbacks :create
    end
  end

  let(:sns_client) { Aws::SNS::Client.new(stub_responses: true) }
  let(:topic_arn) { 'arn:aws:sns:us-west-2:YOUR_ACCOUNT_ID:YOUR_TOPIC_NAME' }
  let(:model) { DummyModel.new(title: 'Dummy Title') }

  before do
    Aws::SNS::Client.stub(:new, sns_client) do
      @model = model
    end
  end

  test '#send_notification publishes a message to the SNS topic' do
    @model.save

    assert_received(sns_client) do |expect|
      expect.publish(topic_arn: topic_arn, message: 'New DummyModel created: Dummy Title')
    end
  end
end
