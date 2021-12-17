## 委譲と継承について

https://blog.aotak.me/post/40594338634/forwardings

=> クラスを継承すると、不要なメゾッドまでついてきてしまうので、欲しいメゾッドだけ導入したい時に委譲をする。

### Forwardable を使わないと

Array を継承していないので、初期化の中で
本来継承したいオブジェクトのインスタンスを生成する

```
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

```

でも、欲しいメゾッドを全部定義するのが面倒

### Forwardable を使うと

委譲したい対象のクラスに、委譲元のクラスが持つインスタンスメゾッドを
def_delegator によって実装できる

```
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
```

def_delegators は可長引数を受けるので
まとめて委譲したいメゾッドを定義することができる。

```
require "forwardable"

class Stack
  extend Forwardable
  def_delegators :@array, :push, :pop, :clear, :size
  def initialize
    @array = Array.new
  end
end
```

def_delegator は、第三引数にメソッド名を指定すると、プロキシとして機能する

```
class Queue
  extend Forwardable
  def_delegator :@array, :push, :enqueue
  def_delegator :@array, :shift, :dequeue
  def_delegators :@array, :clear, :size
  def initialize
    @array = Array.new
  end
end

q = Queue.new
q.enqueue("hoge") # @array.pushを呼ぶ
q.enqueue("fuga")
p q.dequeue # @array.shiftを呼ぶ
            # =>"hoge"
```
