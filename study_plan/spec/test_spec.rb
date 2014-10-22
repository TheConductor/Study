require_relative 'Test'

describe Test do
	it "should return true" do
		test_item = Test.new
		expect(test_item.return_true).to be true
	end
end
