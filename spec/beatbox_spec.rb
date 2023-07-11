require './lib/beatbox'
require './lib/linked_list'
require './lib/node'

RSpec.describe BeatBox do
  describe "#initialize" do
    it "exists" do
      bb = BeatBox.new

      expect(bb).to be_an_instance_of(BeatBox)
    end

    it "initializes with a LinkedList" do
      bb = BeatBox.new

      expect(bb.list).to be_an_instance_of(LinkedList)
      expect(bb.list.head).to eq(nil)
    end
  end

  describe "#append" do
    it "can append a single value to its linkedlist" do
      bb = BeatBox.new

      bb.append("deep")

      expect(bb.list.head.data).to eq("deep")
    end

    it "can append multiple nodes at the same time" do
      bb = BeatBox.new

      bb.append("deep doo ditt")

      expect(bb.list.head.data).to eq("deep")
      expect(bb.list.head.next_node.data).to eq("doo")
    end

    it "only appends data found in valid_beats.txt" do
      bb = BeatBox.new

      bb.append("deep doo ditt")
      expect(bb.all).to eq("deep doo ditt")

      bb.append("Mississippi")
      expect(bb.all).to eq("deep doo ditt")

      bb.append("Mississippi woo hoo shu")
      expect(bb.all).to eq("deep doo ditt woo hoo shu")
    end
  end

  describe "#count" do
    it "returns the length of the linkedlist" do
      bb = BeatBox.new

      bb.append("deep doo ditt")
      bb.append("woo hoo shu")

      expect(bb.count).to eq(6)
    end
  end

  describe "#play" do
    xit "plays the linkedlist's nodes as if beatboxing" do
      bb = BeatBox.new

      bb.append("deep doo ditt woo hoo shu")
      
      expect(bb.play).to eq(6)
    end
  end

  describe "#all" do
    it "returns all nodes data from the linkedlist as a string" do
      bb = BeatBox.new

      bb.append("deep doo ditt woo hoo shu")
      
      expect(bb.all).to eq("deep doo ditt woo hoo shu")
    end
  end

  describe "#generate_valid_beats" do
    it "reads valid_beats.txt and returns an array of its values" do
      bb = BeatBox.new

      # worth noting this test fails if the file is edited
      expect(bb.valid_beats).to eq(["tee", "dee", "deep", "bop", "boop",
      "la", "na", "woo", "hoo", "shu", "ditt", "doo", "dop"])
    end
  end

  describe "#initialize_with_data" do
    it "appends data passed during instantiation" do
      bb = BeatBox.new("deep")
      bb2 = BeatBox.new("deep doo Mississippi")

      expect(bb.list.head.data).to eq("deep")
      expect(bb2.all).to eq("deep doo")
    end
  end

  describe "#rate" do
    xit "sets the rate at which #play is read" do
      bb = BeatBox.new("deep dop dop deep")

      expect(bb.play).to eq(4)

      bb.rate = 100

      expect(bb.rate).to eq(100)
      expect(bb.play).to eq(4)
    end
  end

  describe "#voice" do
    it "sets the voice used for #play" do
      bb = BeatBox.new("deep dop dop deep")

      expect(bb.play).to eq(4)

      bb.voice = "Daniel"
      
      # should be read in Daniel's voice
      expect(bb.play).to eq(4)
    end
  end

  describe "#reset_rate" do
    it "resets rate to the default value of 500" do
      bb = BeatBox.new("deep dop dop deep")

      bb.rate = 100
      expect(bb.rate).to eq(100)

      bb.reset_rate

      expect(bb.rate).to eq(500)
    end
  end
end