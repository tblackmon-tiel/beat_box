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
    if !@head
      0
    else
      current_node = @head
      node_count = 1

      while current_node.next_node != nil
        current_node = current_node.next_node
        node_count += 1
      end

      node_count
    end
  end

  def to_string
    @head.data if @head
  end
end