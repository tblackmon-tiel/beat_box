require_relative 'node'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    if @head
      1
    else
      0
    end
  end

  def to_string
    @head.data if @head
  end
end