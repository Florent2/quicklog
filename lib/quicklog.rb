require "quicklog/version"
require 'debug_inspector'

module Quicklog
  def self.ql var_symbol
    RubyVM::DebugInspector.open do |inspector|
      value = eval var_symbol.to_s, inspector.frame_binding(3)
      puts "#{var_symbol} = #{value}"
    end
  end
end

module Kernel
  def ql var_symbol
    Quicklog.ql var_symbol
  end
  module_function :ql
end
