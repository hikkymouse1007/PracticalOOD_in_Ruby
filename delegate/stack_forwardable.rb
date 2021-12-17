require "forwardable"

class Stack
  extend Forwardable
  def_delegator :@array, :push
  def_delegator :@array, :pop
  def_delegators :@array, :clear, :size
  def initialize
    @array = Array.new
  end
end