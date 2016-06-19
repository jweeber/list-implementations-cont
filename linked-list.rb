# Quick Example of a Self Referential Data Structure in Ruby
# NODE -> contains a value and a pointer to (next_node)
# LinkedList -> This class holds the linked list functions - adding a node, traversing and displaying the linked list

class Node
   attr_accessor :value, :next_node

   def initialize(val,next_in_line=nil)
     @value = val
     @next_node = next_in_line
     #puts "Initialized a Node with value:  " + value.to_s
   end
end

class LinkedList
   def initialize
     @head = nil
     @size = 0
   end

   def add(value)
    if @size == 0
       @head = Node.new(value,nil)
       @size += 1
    else
     # Traverse to the end of the list
     # And insert a new node over there with the specified value
     current = @head
     while current.next_node != nil
         current = current.next_node
     end
     current.next_node = Node.new(value,nil)
     @size += 1
   end
     self
  end

   def delete(val)
       return nil if @size == 0
       if @head.value == val
           # If the head is the element to be delete, the head needs to be updated
           @head = @head.next_node
           @size -= 1
       else
           # ... x -> y -> z
           # Suppose y is the value to be deleted, you need to reshape the above list to :
           #   ... x->z
           previous = @head
           current = @head.next_node
           while current != nil && current.value != val
               previous = current
               current = current.next_node
           end

           if current != nil
               previous.next_node = current.next_node
               @size -= 1
           end
       end
   end

   def display
       # Traverse through the list till you hit the "nil" at the end
       current = @head
       full_list = []
       while current.next_node != nil
           full_list += [current.value.to_s]
           current = current.next_node
       end
       full_list += [current.value.to_s]
       puts "===" + full_list.join("->") + "==="
   end

   def include?(key)
     current = @head
     while current != nil
       return true if current.value == key
       current = current.next_node
     end
     return false
   end

   def size
     return @size
   end

   def max
     return nil if @size == 0
     max = @head.value
     current = @head.next_node
     while current != nil
       if current.value > max
         max = current.value
       end
       current = current.next_node
     end
     return max
   end

   # write a method for reverse

  def reverse
    current = @head
    current_index = @size - 1
    full_list = []
    while current != nil
      full_list.insert(current_index, current.value)
      current_index -= 1
      current = current.next_node
    end
    # not sure how to do this without auxillary storage.
    return full_list.join("=>") 
  end

  def sort
    # None of this works one bit, and I've spent too much time getting no where.
    # So here is a mess of things I've tried.

    # traverse through multiple times, move nodes to the end
    #  use size to figure out how many times to go through, next time go through one less time
    # get head and assign to current
    # get next node
    # if current is > next node, swap them
    # previous = @head # 10
    # current = @head.next_node # 2
    # size = @size
    # # full_list = []
    # while current != nil 
    #   size.times do |num|
    #       if previous.value > current.value
    #         current = previous # current = 10
    #         # previous = current # previous = 2
    #       else
    #       end
    #       puts previous.value # 2
    #       puts current.value
    #       current = current.next_node
    #     end
    # end
    # return full_list
  end
end

new_list = LinkedList.new
new_list.add(10)
new_list.add(2)
new_list.add(33)
new_list.add(50)
new_list.add(4)
puts new_list.sort

puts new_list.reverse


