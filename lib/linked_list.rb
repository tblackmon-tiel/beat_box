require_relative 'node'

class LinkedList
  attr_reader :head
  def initialize
    @head = nil
  end

  def navigate_list(optional_request = nil)
    current_node = @head
    node_count = 1

    while current_node.next_node != nil
      current_node = current_node.next_node
      node_count += 1
    end

    if optional_request == "count"
      node_count
    else
      current_node
    end
  end

  # refactor append, count, to_string to work off one method returning a hash?
  def append(data)
    if !@head
      @head = Node.new(data)
    else
      navigate_list.next_node = Node.new(data)
    end
  end

  def count
    if !@head
      0
    else
      navigate_list("count")
    end
  end

  def to_string
    if !@head
      nil
    else
      current_node = @head
      combined_node_data = ""
      combined_node_data << @head.data

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

  def insert(position, data)
    if position == 0
      prepend(data)
    else
      current_node = @head
      node_counter = 1

      while current_node.next_node != nil && node_counter < position
        current_node = current_node.next_node
      end

      new_node = Node.new(data)
      new_node.next_node = current_node.next_node
      current_node.next_node = new_node  
    end
  end

  def find(position, range)
    current_node = @head
    current_position = 0
    range_counter = 1
    combined_node_data = ""

    while current_node.next_node != nil && current_position < position
      current_node = current_node.next_node
      current_position += 1
    end

    combined_node_data << current_node.data
    while current_node.next_node != nil && range_counter < range
      current_node = current_node.next_node
      combined_node_data << " #{current_node.data}"
      range_counter += 1
    end

    combined_node_data
  end

  def includes?(data)
    current_node = @head

    while current_node.next_node != nil && data != current_node.data
      current_node = current_node.next_node
    end

    if current_node.data == data
      true
    else
      false
    end
  end

  def pop
    current_node = @head

    # this could use the count method instead
    while current_node.next_node != nil
      current_node = current_node.next_node
    end

    final_node = current_node
    current_node = @head

    while current_node.next_node != final_node
      current_node = current_node.next_node
    end

    current_node.next_node = nil
    final_node.data
  end
end