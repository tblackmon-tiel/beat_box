require_relative 'node'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def append(data)
    if !@head
      @head = Node.new(data)
    else
      current_node = @head

      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      
      current_node.next_node = Node.new(data)
    end
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