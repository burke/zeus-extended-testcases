# go to a rails folder and ruby ../TEST_APP.rb
require 'minitest/spec'
require 'minitest/autorun'
gem 'testrbl' # install this or line-number test will fail

describe "app" do
  def zeus
    ENV['RUN_ZEUS'] || 'zeus'
  end

  def test_runner
    actual = `#{zeus} runner "puts Widget.inspect"`.chomp
    expected = %r{Widget\(id: integer, created_at: datetime, updated_at: datetime\)}
    assert_match expected, actual
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
    actual = `#{zeus} rake middleware`.chomp
    expected = /use ActionDispatch::ParamsParser/
    assert_match expected, actual
  end

  def test_generate
    actual = `#{zeus} generate migration omg`.chomp
    expected = /Another migration is already named omg/
    assert_match expected, actual
  end

  def test_rspec
    actual = `#{zeus} rspec spec/simple_spec.rb`.chomp
    expected = /1 example, 0 failures/
    assert_match expected, actual
  end

  describe "testrb" do
    it "should runs via testrb" do
      actual = `#{zeus} testrb test/simple_test.rb`.chomp
      expected = /2 tests, 2 assertions, 0 failures, 0 errors/
      assert_match expected, actual
      assert $?.success?
    end

    it "should runs via testrb and -n" do
      actual = `#{zeus} testrb test/simple_test.rb -n '/2/'`.chomp
      expected = /1 tests, 1 assertions, 0 failures, 0 errors/
      assert_match expected, actual
      assert $?.success?
    end

    it "should runs via testrb and line number" do
      actual = `#{zeus} testrb test/simple_test.rb:10`.chomp
      expected = /1 tests, 1 assertions, 0 failures, 0 errors/
      assert_match expected, actual
      assert $?.success?
    end

    it "should exit with error state when tests fail" do
      actual = `#{zeus} testrb test/fail.rb`.chomp
      expected = /1 error/
      assert_match expected, actual
      assert !$?.success?
    end
  end
end
