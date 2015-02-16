require 'Test'

describe Test do
  it "should pass by expecting test to return true" do
    test_item = Test.new
    expect(test_item.return_true).to be true
  end
end
