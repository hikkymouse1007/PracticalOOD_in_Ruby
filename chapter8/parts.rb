# Forwardable: https://docs.ruby-lang.org/ja/latest/class/Forwardable.html
# def_delegators: https://docs.ruby-lang.org/ja/latest/method/Forwardable/i/def_delegators.html
# Enumerable: https://docs.ruby-lang.org/ja/latest/class/Enumerable.html
## Array, Hash, Range, Enumerator等のクラスで、 Enumerableモジュールはインクルードされています。
## ただし、効率化のため、そのクラスでEnumerableと同名･同等の機能を再定義(オーバーライド)しているケースも少なくなく、特にArrayクラスでは同名のメソッドを再定義していることが多いです。

require 'forwardable'
class Parts
  extend Forwardable
  def_delegators :@parts, :size, :each
  include Enumerable # 繰り返しを行なうクラスのための Mix-in。このモジュールのメソッドは全て each を用いて定義されているので、インクルードするクラスには each が定義されていなければなりません。

  def initialize(parts)
    @parts = parts
  end

  def spares
    select {|part| part.needs_spare} # Enumerableモジュールの持つ selectメゾッドを使用できる
  end
end