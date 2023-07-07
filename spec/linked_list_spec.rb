require './lib/linked_list'
require './lib/node'

RSpec.describe LinkedList do
  describe "#initialize" do
    it "exists" do
      list = LinkedList.new

      expect(list).to be_an_instance_of(LinkedList)
    end
  end

  describe "#head" do
    it "has a default head value of nil" do
      list = LinkedList.new

      expect(list.head).to eq(nil)
    end
  end

  describe "#append" do
    it "adds a node to the list" do
      list = LinkedList.new

      list.append("doop")
      # require 'pry'; binding.pry

      expect(list.head.data).to eq("doop")
      expect(list.head.next_node).to eq(nil)
    end
  end

  describe "#count" do
    it "returns the number of nodes in the list (when there is one node)" do
      list = LinkedList.new

      expect(list.count).to eq(0)

      list.append("doop")

      expect(list.count).to eq(1)
    end
  end

  describe "#string" do
    it "returns heads data as a string (when there is one node)" do
      list = LinkedList.new

      list.append("doop")

      expect(list.to_string).to eq("doop")
    end

    it "does not break if there are no nodes" do
      list = LinkedList.new

      expect(list.to_string).to eq(nil)
    end
  end
end