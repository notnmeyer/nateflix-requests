module AWSHelpers
  def stub_sns_client
    Aws.config[:sns] = {
      stub_responses: {
        publish: {}
      }
    }
  end
end

