# 委譲とは: https://blog.aotak.me/post/40594338634/forwardings
# 継承すると、継承したくないものまでついてきてめんどくさい
#
class Stack
  def initialize
    @array = Array.new
  end
  def push(val)
    @array.push(val)
  end
  def pop
    @array.pop
  end
  def clear
    @array.clear
  end
  def size
    @array.size
  end
end