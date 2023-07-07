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
  end
end