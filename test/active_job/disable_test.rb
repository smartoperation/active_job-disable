require 'test_helper'

class ActiveJob::DisableTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveJob::Disable::VERSION
  end

  def test_load
    ActiveJob::Base.queue_adapter = :disable
  end
end
