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

    it "can add more than one node to the list" do
      list = LinkedList.new

      list.append("doop")
      list.append("deep")
      # require 'pry'; binding.pry
      
      expect(list.head.data).to eq("doop")
      expect(list.head.next_node).to be_an_instance_of(Node)
      expect(list.head.next_node.data).to eq("deep")
    end
  end

  describe "#count" do
    it "returns the number of nodes in the list (when there is one node)" do
      list = LinkedList.new

      expect(list.count).to eq(0)

      list.append("doop")

      expect(list.count).to eq(1)
    end

    it "returns the number of nodes in the list with multiple nodes" do
      list = LinkedList.new

      list.append("doop")
      list.append("deep")

      expect(list.count).to eq(2)
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

    it "returns a string of all node data with spaces inbetween" do
      list = LinkedList.new

      list.append("doop")
      list.append("deep")

      expect(list.to_string).to eq("doop deep")
    end
  end

  describe "#prepend" do
    it "can add a node to the front of the list" do
      list = LinkedList.new

      list.append("plop")
      expect(list.to_string).to eq("plop")
      
      list.append("suu")
      expect(list.to_string).to eq("plop suu")
      
      list.prepend("dop")

      expect(list.to_string).to eq("dop plop suu")
      expect(list.count).to eq(3)
    end
  end

  describe "#insert" do
    it "can insert a new node to a specific index in the list" do
      list = LinkedList.new

      list.append("plop")
      list.append("suu")
      list.prepend("dop")

      list.insert(1, "woo")

      expect(list.to_string).to eq("dop woo plop suu")
    end

    it "can insert a new node to the front of the list" do
      list = LinkedList.new

      list.append("plop")
      list.append("suu")
      list.prepend("dop")

      list.insert(0, "woo")
      require 'pry';binding.pry
      expect(list.to_string).to eq("woo dop plop suu")
    end

    it "can handle a position larger than the size of the list" do
      
    end
  end
end