require_relative './node'

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
        if self.head != nil
            node.next_node = @head
        end
        self.head = node
    end

    def append(node)
        if head.nil?
            self.head = node
            return
        end

        last_node = head
        while last_node.next_node
            last_node = last_node.next_node
        end

        last_node.next_node = node
    end

    def delete_head
        if head.nil?
            return
        end

        @head = head.next_node
    end

    def delete_tail
        if head.nil?
            return
        end
        if head.next_node.nil?
            self.delete_head
            return
        end

        last_node = head
        while last_node.next_node.next_node
            last_node = last_node.next_node
        end
        last_node.next_node = nil
    end

    def add_after(index, node)
        prev_node = head
        index.times do
            prev_node = prev_node.next_node
        end
        if prev_node.respond_to?(:next_node=)
            node.next_node = prev_node.next_node 
            prev_node.next_node = node
        else
            self.append(node)
        end
    end

    def search(value)
        last_node = head
        while last_node
            if last_node.data == value
                return last_node
            end
            last_node = last_node.next_node
        end
    end
end
