require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def inspect
    to_s
  end

  def get(key)
    # debugger
    if @map.include?(key)
      @map.get(key).val
    else
      val = @prc.call(key)
      calc!(key, val)
      if @map.count > @max
        oldest_key = @store.first.key
        @store.remove(oldest_key)
        @map.delete(oldest_key)
      end
      return val
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key, val)
    # suggested helper method; insert an (un-cached) key
    @store.append(key, val)
    @map.set(key, @store.last)
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
  end
end
