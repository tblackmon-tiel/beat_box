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
      # require 'pry';binding.pry
      expect(list.to_string).to eq("woo dop plop suu")
    end

    it "can handle a position larger than the size of the list" do
      list = LinkedList.new

      list.append("plop")
      list.append("suu")
      list.prepend("dop")

      list.insert(5, "woo")

      expect(list.to_string).to eq("dop plop suu woo")
    end
  end

  describe "#find" do
    it "can return the node data at a given position" do
      list = LinkedList.new

      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.find(2, 1)).to eq("shi")
    end

    it "can return multiple nodes data starting at a position" do
      list = LinkedList.new

      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.find(1, 3)).to eq("woo shi shu")
    end
    
    it "does not error if given an inaccessible position/range" do
      list = LinkedList.new
  
      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")
  
      expect(list.find(10,1)).to eq("blop")
      expect(list.find(2, 5)).to eq("shi shu blop")
      expect(list.find(5, 3)).to eq("blop")
    end
  end

  describe "#includes?" do
    it "returns a boolean identifying if an argument exists in the list" do
      list = LinkedList.new

      list.append("deep")
      list.append("bop")
      list.append("shu")
      
      expect(list.includes?("deep")).to be true
      expect(list.includes?("bop")).to be true
      expect(list.includes?("dep")).to be false
    end
  end

  describe "#pop" do
    it "removes and returns the final object in the list" do
      list = LinkedList.new

      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.pop).to eq("blop")
      expect(list.pop).to eq("shu")
      expect(list.to_string).to eq("deep woo shi")
    end
  end
  
  describe "#navigate_list" do
    it "returns the final node in the list" do
      list = LinkedList.new

      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.navigate_list.data).to eq("blop")
    end

    it "returns the list length if passed an argument of 'count'" do
      list = LinkedList.new

      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.navigate_list("count")).to eq(5)
    end

    it "returns a string of all node data concatenated if passed an argument of 'string'" do
      list = LinkedList.new

      list.append("deep")
      list.append("woo")
      list.append("shi")
      list.append("shu")
      list.append("blop")

      expect(list.navigate_list("string")).to eq("deep woo shi shu blop")
    end
  end
end