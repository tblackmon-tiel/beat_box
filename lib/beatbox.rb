class BeatBox
  attr_reader :list, :valid_beats
  def initialize()
    @list = LinkedList.new
    @valid_beats = generate_valid_beats
  end

  def append(data)
    split_data = data.split

    split_data.each do |data|
      if @valid_beats.include?(data)
        @list.append(data)
      end
    end
  end

  def count
    @list.count
  end

  def play
    `say -r 500 -v Boing #{list.to_string}`
  end

  def all
    @list.to_string
  end

  def generate_valid_beats
    beats_from_file = []
    File.foreach("./lib/valid_beats.txt") {|line| beats_from_file << line.chomp!}
    beats_from_file
  end
end