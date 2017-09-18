require 'test_helper'

class ActiveJob::DisableTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::ActiveJob::Disable::VERSION
  end

  def test_it_does_something_useful
    assert false
  end
end
