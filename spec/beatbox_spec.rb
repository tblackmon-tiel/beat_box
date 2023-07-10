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
      
      expect(bb.play).to eq(`say -r 500 -v Boing deep doo ditt woo hoo shu`)
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
      "la", "na", "woo", "hoo", "shu", "ditt", "doo"])
    end
  end
end