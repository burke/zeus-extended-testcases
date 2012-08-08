require 'minitest/autorun'

class AppTest < MiniTest::Unit::TestCase

  def test_runner
    actual = `zeus runner "puts Widget.inspect"`.chomp
    expected = %r{Widget\(id: integer, created_at: datetime, updated_at: datetime\)}
    assert expected =~ actual
  end

  def test_server
    # TODO: how?
    skip
  end

  def test_console
    # TODO: how?
    skip
  end

  def test_rake
    actual = `zeus rake middleware`.chomp
    expected = /use ActionDispatch::ParamsParser/
    assert expected =~ actual
  end

  def test_generate
    actual = `zeus generate migration omg`.chomp
    expected = /Another migration is already named omg/
    assert expected =~ actual
  end

  def test_rspec
    actual = `zeus rspec spec/simple_spec.rb`.chomp
    expected = /1 example, 0 failures/
    assert expected =~ actual
  end

  def test_testrb
    actual = `zeus testrb test/simple_test.rb`.chomp
    expected = /1 tests, 1 assertions, 0 failures, 0 errors/
    assert expected =~ actual
  end


end

