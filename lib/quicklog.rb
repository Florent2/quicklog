require "quicklog/version"
require 'debug_inspector'

module Quicklog
  def self.ql param
    output = param.is_a?(Symbol) ? label_and_value_as_string(param) : String(param)
    puts reverse_video output
  end

  private

  def self.label_and_value_as_string symbol
    RubyVM::DebugInspector.open do |inspector|
      value = eval symbol.to_s, inspector.frame_binding(4)
      "#{symbol} = #{value.inspect}"
    end
  end

  def self.reverse_video string
    "\e[7m" + string + "\e[0m"
  end
end

module Kernel
  def ql param
    Quicklog.ql param
  end
  module_function :ql
end
