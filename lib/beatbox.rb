class BeatBox
  attr_reader :list
  def initialize()
    @list = LinkedList.new
  end

  def append(data)
    split_data = data.split

    split_data.each do |data|
      @list.append(data)
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
end