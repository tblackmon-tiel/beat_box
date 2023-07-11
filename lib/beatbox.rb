class BeatBox
  attr_accessor :rate
  attr_reader :list, :valid_beats
  def initialize(initial_data = nil)
    @list = LinkedList.new
    @valid_beats = generate_valid_beats
    @initial_data = initial_data
    @rate = 500
    
    initialize_with_data
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
    `say -r #{@rate} -v Boing #{@list.to_string}`
    count
  end

  def all
    @list.to_string
  end

  def generate_valid_beats
    beats_from_file = []
    File.foreach("./lib/valid_beats.txt") {|line| beats_from_file << line.chomp!}
    beats_from_file
  end

  def initialize_with_data
    if @initial_data != nil
      append(@initial_data)
    end
  end
end