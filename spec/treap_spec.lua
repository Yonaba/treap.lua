require 'luacov'
local treap = require "treap"

context("treap.lua interface implements", function()
      
  context('new()', function()
		
		test('creates a new treap', function()
			local root = treap.new(0)
			assert_equal(root.key, 0)
		end)
		
		test('by default, it will have a random numeric priority', function()
			local root = treap.new(0)
			assert_type(root.priority, 'number')
		end)
		
		test('priority can be set via treap.new()', function()
			local root = treap.new(0, math.pi)
			assert_equal(root.priority, math.pi)
		end)
		
  end)
	
  context('insert()', function()
		
		test('adds keys to a treap', function()
			local root = treap.new(0)
			root = treap.insert(root, 1)
			assert_equal(treap.find(root, 1).key, 1)
			root = treap.insert(root, 2)
			assert_equal(treap.find(root, 2).key, 2)			
			root = treap.insert(root, 3)
			assert_equal(treap.find(root, 3).key, 3)			
		end)
		
  end)	
  
  context('delete()', function()
		
		test('deletes keys from a treap', function()
			local root = treap.new(0)
			root = treap.insert(root, 1)
			root = treap.insert(root, 2)
			root = treap.insert(root, 3)
			
			root = treap.delete(root, 2)
			assert_nil(treap.find(root,2))
			
			root = treap.delete(root, 3)
			assert_nil(treap.find(root,3))
			
			root = treap.delete(root, 1)
			assert_nil(treap.find(root,1))
			
			root = treap.delete(root, 0)
			assert_nil(treap.find(root,0))	
		end)
		
  end)
	
  context('find()', function()
	
		test('finds a key in a treap', function()
			local root = treap.new(0)
			local rand = {}
			for i = 1, 1000 do 
				rand[i] = math.random(1,1000)
				root = treap.insert(root, i)
			end
			for i = 1, 1000 do 
				assert_equal(treap.find(root,i).key, i)
			end
		end)
  end)

	context('inorder()', function()
		local root
		local inorder
		
		before(function()
			root = treap.insert(root, 50)
			root = treap.insert(root, 30)
			root = treap.insert(root, 20)
			root = treap.insert(root, 40)
			root = treap.insert(root, 70)
			root = treap.insert(root, 60)
			root = treap.insert(root, 80)
			
			inorder = {}
			
			treap.inorder(root, function(node) 
				table.insert(inorder, node.key) 
			end)

		end)
		
		test('traverses a treap', function()		
				assert_equal(inorder[1], 20)
				assert_equal(inorder[2], 30)
				assert_equal(inorder[3], 40)
				assert_equal(inorder[4], 50)
				assert_equal(inorder[5], 60)
				assert_equal(inorder[6], 70)
				assert_equal(inorder[7], 80)
		end)
		
	end)
	
	context('size()', function()
	
		test('returns the size of a treap', function()
			local root = treap.new(0)
			assert_equal(treap.size(root), 1)
			root = treap.insert(root, 2)
			root = treap.insert(root, 8)
			root = treap.insert(root, 10)
			assert_equal(treap.size(root), 4)
			root = treap.delete(root, 8)
			assert_equal(treap.size(root), 3)			
		end)
		
	end)
	
end)