require "quicklog"
require "mocoso"
require "minitest"
Minitest.autorun

def in_reverse_video string
  "\e[7m" + string + "\e[0m"
end

class QuicklogTest < Minitest::Test
  include Mocoso

  def test_log_variable_label_and_value_in_reverse_video
    my_var   = 2
    expected = in_reverse_video "my_var = 2"

    expect $stdout, :puts, with: [expected], returns: nil do
      ql :my_var
    end
  end

  def test_log_object_attribute
    person   = Struct.new(:name).new "David"
    expected = in_reverse_video "person.name = David"

    expect $stdout, :puts, with: [expected], returns: nil do
      ql :"person.name"
    end
  end

  def test_log_string
    expected = in_reverse_video "my message"

    expect $stdout, :puts, with: [expected], returns: nil do
      ql "my message"
    end
  end

  def test_log_object_convertible_to_string
    expected = in_reverse_video "2"

    expect $stdout, :puts, with: [expected], returns: nil do
      ql 2
    end
  end

end
