require './lib/node'

RSpec.describe Node do
  describe "#initialize" do
    it "exists" do
      node = Node.new("plop")

      expect(node).to be_an_instance_of(Node)
    end
  end
end