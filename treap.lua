------------------
-- *treap.lua*, a simple treap data structure implemented in Lua.
-- Source on [Github](http://github.com/Yonaba/treap.lua)
-- @author [Roland Yonaba](http://github.com/Yonaba/)
-- @copyright 2017
-- @license [MIT](http://github.com/Yonaba/blob/master/LICENSE)

-- Private definitions
local random = math.random
local _MODULEVERSION = '0.1.0'

-- Performs right rotation on node y
local function rightRotate(y)
  local x = y.left
  local tail = x.right
  x.right = y
  y.left = tail
  return x
end

-- Performs left rotation on node x
local function leftRotate(x)
  local y = x.right
  local tail = y.left
  y.left = x
  x.right = tail
  return y
end

------------------------------- Module functions ------------------------------

--- Creates a treap node.
-- @name node
-- @param key a key
-- @param[opt] priority a numeric priority for the given key. Defaults to random value.
-- @return a node 
local function newTreap(key, priority)
  return {
    key = key,
    priority = priority or random(),
    left = nil,
    right = nil
  }
end

--- Finds a key in the treap
-- @name find
-- @param root a root node in the treap
-- @param key a key
-- @return a node (or nil)
local function find(root, key)
  if root == nil or root.key == key then return root end
  if root.key < key then return find(root.right, key) end
  return find(root.left, key)
end

--- Inserts a key in the treap
-- @name insert
-- @param root a root node in the treap
-- @param key a key
-- @return the root node 
local function insert(root, key, priority)
  if root == nil then return newTreap(key, priority) end
  if key <= root.key then
    root.left = insert(root.left, key)
    if root.left.priority > root.priority then
      root = rightRotate(root)
    end
  else
    root.right = insert(root.right, key)
    if root.right.priority > root.priority then
      root = leftRotate(root)
    end
  end
  return root
end

--- Deletes a key in the treap
-- @name delete
-- @param root a root node in the treap
-- @param key a key
-- @return the root node 
local function delete(root, key)
  if root == nil then return root end
  if key < root.key then
    root.left = delete(root.left, key)
  elseif key > root.key then
    root.right = delete(root.right, key)
  elseif root.left == nil then
    root = root.right
  elseif root.right == nil then
    root = root.left
  elseif root.left.priority < root.right.priority then
    root = leftRotate(root)
    root.left = delete(root.left, key)
  else
    root = rightRotate(root)
    root.right = delete(root.right, key)
  end
  return root
end

--- In-order traversal. It maps `f (node, ...)` on every node along the traversal.
-- @name inorder
-- @param root a root node in the treap
-- @param f a function, defined as `f (node, ...)`
-- @param[opt] ... optional arguments to `f`
local function inorder(root, f, ...)
  if root == nil then return end
  inorder(root.left, f, ...)
  f(root,...)    
  inorder(root.right, f, ...)
end


--- Returns the treap size. 
-- @name size
-- @param root a root node in the treap
local function size(root)
  local n = 0
  inorder(root, function() n = n + 1 end)
  return n
end


return  {
  new = newTreap,
  insert = insert,
  delete = delete,
  find = find,
  inorder = inorder,
  size = size,
  _VERSION     = 'treap.lua v'.._MODULEVERSION,
  _URL         = 'http://github.com/Yonaba/treap.lua',
  _LICENSE     = 'MIT <http://raw.githubusercontent.com/Yonaba/treap.lua/master/LICENSE>',
  _DESCRIPTION = 'A simple treap data structure implementated in Lua'  
}