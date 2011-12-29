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

