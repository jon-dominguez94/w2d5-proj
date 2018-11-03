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

  def get(key)
    if @map.include?(key)
      @map.get(key)
    else
      val = @prc.call(key)
      # debugger
      @store.append(key, val)
      @map.set(key, @store.last)
      if @map.count > @max
        oldest_key = @store.first.key
        @store.remove(oldest_key)
        @map.delete(key)
      end
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
  end
end
