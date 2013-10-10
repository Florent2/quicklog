require "quicklog/version"
require 'debug_inspector'

module Quicklog
  def self.ql var_symbol
    RubyVM::DebugInspector.open do |inspector|
      value = eval var_symbol.to_s, inspector.frame_binding(3)
      puts reverse_video "#{var_symbol} = #{value}"
    end
  end

  private

  def self.reverse_video string
    "\e[7m" + string + "\e[0m"
  end
end

module Kernel
  def ql var_symbol
    Quicklog.ql var_symbol
  end
  module_function :ql
end
