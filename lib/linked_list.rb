require 'linked_list_item'

class LinkedList
  attr_reader :first_item

  def initialize *args

  end

  def add_item(payload)
    new_item = LinkedListItem.new(payload)
    if @first_item.nil?
      @first_item = new_item
    else
      final_item = @first_item
      until final_item.last?
        final_item = final_item.next_list_item
      end
      final_item.next_list_item = new_item
    end
  end

  def get(n)
    item = @first_item
    n.times do
      raise IndexError if item.nil?
      item = item.next_list_item
    end 
    item.payload
  end

  def last
    return nil if @first_item.nil?
    item = @first_item
    until item.last?
      item = item.next_list_item
    end
    item.payload
  end


  def size
    item = @first_item
    size = 0
    until item.nil?
      item = item.next_list_item
      size += 1
    end
    size
  end

  def to_s
    return "| |" if @first_item.nil?
    item= @first_item
    list = "#{item.payload}"
    until item.last?
      item = item.next_list_item
      list += ", " + item.payload
    end
    "| #{list} |"
  end

  # ========= Bonus ========== #

  def [](payload)
  end

  def []=(n, payload)
  end

  def remove(n)
  end

  # ========= Bonus ========== #

  def indexOf(payload)
    index = 0
    size = self.size

    until index == size
      return index if get(index) == payload
      index += 1
    end 
  end


end
