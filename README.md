[![Build Status](https://travis-ci.org/Yonaba/treap.lua.png)](https://travis-ci.org/Yonaba/treap.lua)
[![Coverage Status](https://coveralls.io/repos/Yonaba/treap.lua/badge.png?branch=master)](https://coveralls.io/r/Yonaba/treap.lua?branch=master)
[![License](http://img.shields.io/badge/Licence-MIT-brightgreen.svg)](LICENSE)


A implementation of the [Treap](https://en.wikipedia.org/wiki/Treap) data structure in the [Lua Programming language](http://www.lua.org).

## Download & Installation
### Bash

```bash
git clone https://github.com/Yonaba/treap.lua
````

### Archive
* __zip__: [0.1.0 (latest stable)](http://github.com/Yonaba/treap.lua/archive/treap.lua-0.1.0-1.zip) | [current](http://github.com/Yonaba/treap.lua/archive/master.zip) | [all](http://github.com/Yonaba/treap.lua/tags)
* __tarball__: [0.1.0 (latest stable)](http://github.com/Yonaba/treap.lua/archive/treap.lua-0.1.0-1.tar.gz) | [current](http://github.com/Yonaba/treap.lua/archive/master.tar.gz) | [all](http://github.com/Yonaba/treap.lua/tags)

### LuaRocks
```
luarocks install treap
````

### MoonRocks

```bash
moonrocks install treap
````


## Usage

```lua
local treap = require "treap"

-- Creates a new treap and store key '0' inside
local root = treap.new(1)

-- Add new keys
root = treap.insert(root, 5)
root = treap.insert(root, 2)
root = treap.insert(root, 4)
root = treap.insert(root, 3)

-- Delete some keys
root = treap.delete(root, 2)
root = treap.delete(root, 3)

-- Search some keys
local node = treap.find(root, 2)
print(node) --> nil, since it was removed!

node = treap.find(root, 1)
print(node.key) --> 1

-- Add some new keys
root = treap.insert(root, 7)
root = treap.insert(root, 6)

-- Get the size
print(treap.size(root)) --> 5

-- Traverse the treap while printing keys
treap.inorder(root, function(node)
  print('Key: '..node.key)
end)
--> Key: 1
--> Key: 4
--> Key: 5
--> Key: 6
--> Key: 7
````
  
## Documentation
* Available in HTML-format for download : see [doc](https://github.com/Yonaba/treap.lua/blob/master/doc).
* Read it in your browser : see [online documentation](http://yonaba.github.io/treap.lua/doc).

## Specification
Spec tests have been included.<br/>
Run them using [Telescope](https://github.com/norman/telescope) with the following command from the root folder:

````
tsc -f spec/*
````

## License
This work is under [MIT-LICENSE](http://www.opensource.org/licenses/mit-license.php).<br/>
Copyright (c) 2017 Roland Yonaba. <br/>
See [LICENSE](LICENSE).


