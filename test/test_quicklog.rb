require "minitest/autorun"
require "mocha/setup"
require "quicklog"

class QuicklogTest < Minitest::Test
  def test_log_variable_label_and_value
    my_var = 2
    $stdout.expects(:puts).with("my_var = 2")
    ql :my_var
  end

  def test_log_object_attribute
    person = Struct.new(:name).new "David"
    $stdout.expects(:puts).with("person.name = David")
    ql :"person.name"
  end
end
