require './lib/node'

RSpec.describe Node do
  describe "#initialize" do
    it "exists" do
      node = Node.new("plop")

      expect(node).to be_an_instance_of(Node)
    end
  end

  describe "#data" do
    it "returns the value of data" do
      node = Node.new("plop")

      expect(node.data).to eq("plop")
    end

    it "can have different values of data" do
      node = Node.new("plop")
      node_2 = Node.new("drop")

      expect(node.data).to eq("plop")
      expect(node_2.data).to eq("drop")
    end
  end

  describe "#next_node" do
    it "returns the next node in the list" do
      node = Node.new("plop")

      expect(node.next_node).to eq(nil)
    end
  end
end