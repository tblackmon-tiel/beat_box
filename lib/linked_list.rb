require_relative 'node'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  # refactor append, count, to_string to work off one method returning a hash?
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
    if !@head
      nil
    else
      current_node = @head
      combined_node_data = @head.data

      while current_node.next_node != nil
        current_node = current_node.next_node
        combined_node_data << " #{current_node.data}"
      end

      combined_node_data
    end
  end

  def prepend(data)
    new_head = Node.new(data)
    new_head.next_node = @head
    @head = new_head
  end
end