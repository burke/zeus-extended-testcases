require 'test_helper'

class SimpleTest < ActiveSupport::TestCase

  def test_widget
    assert Widget.ancestors.include?(ActiveRecord::Base)
  end

  def test_widget2
    assert Widget.ancestors.include?(ActiveRecord::Base)
  end

end
