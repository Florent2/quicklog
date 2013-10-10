require "minitest/autorun"
require "mocha/setup"
require "quicklog"

def in_reverse_video string
  "\e[7m" + string + "\e[0m"
end

class QuicklogTest < Minitest::Test

  def test_log_variable_label_and_value_in_reverse_video
    my_var = 2
    $stdout.expects(:puts).with(in_reverse_video "my_var = 2")
    ql :my_var
  end

  def test_log_object_attribute
    person = Struct.new(:name).new "David"
    $stdout.expects(:puts).with(in_reverse_video "person.name = David")
    ql :"person.name"
  end

  def test_log_string
    $stdout.expects(:puts).with(in_reverse_video "my message")
    ql "my message"
  end

  def test_log_object_convertible_to_string
    $stdout.expects(:puts).with(in_reverse_video "2")
    ql 2
  end

end
