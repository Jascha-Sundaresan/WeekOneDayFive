class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent
    @parent
  end
  
  def children
    @children    
  end
  
  def value
    @value
  end
  
  def parent=(parent_node)
    return @parent = nil if parent_node == nil
    remove_children_from(@parent, self) unless @parent == nil
    @parent = parent_node
    parent_node.children << self    
  end
  
  def add_child(child_node)
    child_node.parent = self
    
  end
  
  def remove_child(child_node)
    raise if child_node.parent == nil
    child_node.parent = nil
    
  end
  
  def dfs(value)
    return self if self.value == value
    
    self.children.each do |child|
      child_result = child.dfs(value)
      return child_result unless child_result == nil
    end
    
    nil
  end
  
  
  def bfs(value)
    return self if self.value == value
    self.children.each do |child|
            
    end
  end
  
  def bfs(value)
    search_queue = [self]
    until search_queue.empty?
      current_node = search_queue.shift
      return current_node if current_node.value == value
      current_node.children.each do |child|
        search_queue << child
      end
    end
  end
  
  private
  def remove_children_from(node, child)
    node.children.reject! {|each_child| each_child == child}
  end
  
end