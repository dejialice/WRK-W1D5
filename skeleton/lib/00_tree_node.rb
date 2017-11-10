require 'byebug'


class PolyTreeNode
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @value = value
    @parent = nil 
    @children = []
  end 
  
  def parent=(new_parent)
    unless self.parent == nil 
      @parent.children.delete(self)
    end
    @parent = new_parent
    unless new_parent == nil
      @parent.children << self 
    end
  end

# old code 
# def parent=(new_parent)  
  # return nil if @parent == childs_parent
  # @parent.children.delete(self) if @parent 
  # @parent = childs_parent




  def add_child(new_child)
    if !@children.include?(new_child)
      new_child.parent = self
    end
    
  end 
  
  def remove_child(child_node)
    raise 'error' unless @children.include?(child_node)
    child_node.parent = nil 

  end
  
  def dfs(target_value)
    return self if target_value == self.value 
    return nil if self.children.empty?
      @children.each do |child| 
        result = child.dfs(target_value) 
        return result unless result.nil?
      end
    nil
  end 
  
  def bfs(target_value)
    queue = []
    queue << self
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      node.children.each do |child| 
        queue << child 
      end 
    end 
  end 

  
  

end
