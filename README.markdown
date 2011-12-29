Database (e.g. MySql) :order=>'rand()' is slow.

## Solution

use <http://jan.kneschke.de/projects/mysql/order-by-rand/> to replace ORDER BY RAND()

## Performance

Now let's see what happends to our performance. We have 3 different queries for solving our problems.

Q1. ORDER BY RAND()
Q2. RAND() * MAX(ID)
Q3. RAND() * MAX(ID) + ORDER BY ID

Q1 is expected to cost N * log2(N), Q2 and Q3 are nearly constant.

The get real values we filled the table with N rows ( one thousand to one million) and executed each query 1000 times.

   100        1.000      10.000     100.000    1.000.000
Q1  0:00.718s  0:02.092s  0:18.684s  2:59.081s  58:20.000s
Q2  0:00.519s  0:00.607s  0:00.614s  0:00.628s   0:00.637s
Q3  0:00.570s  0:00.607s  0:00.614s  0:00.628s   0:00.637s
As you can see the plain ORDER BY RAND() is already behind the optimized query at only 100 rows in the table.


## Install

Gemfile

``` ruby
gem 'fast_random'
```

## Usage

include FastRandom in model

```
class Post < ActiveRecord::Base
  include FastRandom
end
```

### Query

* try: `Post.random.limit(10)`

## License

Copyright (c) 2011 xdite

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions: The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software. THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.