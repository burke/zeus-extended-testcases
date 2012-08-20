require 'test_helper'

class FailTest < ActiveSupport::TestCase
  def test_fail
    raise
  end
end
