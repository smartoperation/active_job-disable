require 'test_helper'
require 'active_job'
require 'action_mailer'

class ActiveJob::DisableTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveJob::Disable::VERSION
  end

  class Load < Minitest::Test
    def test_load
      orig_queue_adapter = ActiveJob::Base.queue_adapter
      ActiveJob::Base.queue_adapter = :disable
      pass
    ensure
      ActiveJob::Base.queue_adapter = orig_queue_adapter
    end
  end

  class Integration < Minitest::Test
    def setup
      @orig_queue_adapter = ActiveJob::Base.queue_adapter
      @orig_delivery_method = ActionMailer::Base.delivery_method
      ActiveJob::Base.queue_adapter = :disable
      ActionMailer::Base.delivery_method = :test
    end

    def teardown
      ActiveJob::Base.queue_adapter = @orig_queue_adapter
      ActionMailer::Base.delivery_method = @orig_delivery_method
    end

    def test_active_job_perform_later_disabled
      assert_raises(ActiveJob::Disable::DisabledError) do
        MyJob.perform_later
      end
    end

    def test_action_mailer_deliver_later_disabled
      assert_raises(ActiveJob::Disable::DisabledError) do
        MyMailer.sendmail.deliver_later
      end
    end

    def test_action_mailer_deliver_now_enabled
      MyMailer.sendmail.deliver_now
      pass
    end

    class MyJob < ActiveJob::Base
      def perform; end
    end

    class MyMailer < ActionMailer::Base
      def sendmail; end
    end
  end
end
