module PrepareInterfaceTest
  def test_implements_the_preparer_interface
    p "interface has been called"
    p "@object: #{@object}"
    assert_respond_to(@object, :prepare_trip)
  end
end