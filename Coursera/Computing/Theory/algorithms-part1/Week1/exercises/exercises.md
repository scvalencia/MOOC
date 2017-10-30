# Union-Find exercises

To specify an array or sequence of values in an answer, separate the values in
the sequence by whitespace. For example, if the question asks for the first
ten powers of two (starting at 1), then the following answer is acceptable:

     1 2 4 8 16 32 64 128 256 512

If you wish to discuss a particular question and answer in the forums, please
post the entire question and answer, including the seed (which can be used by
the course staff to uniquely identify the question) and the explanation (which
contains the correct answer).

## Question 1

Give the `id[]` array that results from the following sequence of 6 union
operations on a set of 10 items using the quick-find algorithm.

    9-3 9-8 5-8 7-1 2-8 8-0  

Your answer should be a sequence of 10 integers, separated by whitespace.

Recall: our quick-find convention for the union operation `p-q` is to change `id[p]`
(and perhaps some other entries) but not `id[q]`.

```java
init 0 1 2 3 4 5 6 7 8 9
9-3: 0 1 2 9 4 5 6 7 8 9
9-8: 0 1 2 8 4 5 6 7 8 8
5-8: 0 1 2 8 4 8 6 7 8 8
7-1: 0 1 2 8 4 8 6 1 8 8
2-8: 0 1 8 8 4 8 6 1 8 8
8-0: 0 1 0 0 4 0 6 1 0 0
```

## Question 2

Give the `id[]` array that results from the following sequence of 9 union
operations on a set of 10 items using the weighted quick-union algorithm from lecture.

    2-5 9-6 3-1 0-7 9-3 2-8 7-5 0-4 5-6 

Your answer should be a sequence of 10 integers, separated by whitespace.

Recall: when joining two trees of equal size, our weighted quick union convention is to
make the root of the second tree point to the root of the first tree. Also, our weighted
quick union algorithm performs union by size (number of nodes) -  not union by height -
and does not do path compression.

```java
init 0 1 2 3 4 5 6 7 8 9
2-5: 0 1 2 3 4 2 6 7 8 9 
9-6: 0 1 2 3 4 2 9 7 8 9 
3-1: 0 3 2 3 4 2 9 7 8 9 
0-7: 0 3 2 3 4 2 9 0 8 9 
9-3: 0 3 2 9 4 2 9 0 8 9 
2-8: 0 3 2 9 4 2 9 0 2 9 
7-5: 2 3 2 9 4 2 9 0 2 9 
0-4: 2 3 2 9 2 2 9 0 2 9 
5-6: 2 3 2 9 2 2 9 0 2 2
```

## Question 3

Which of the following `id[]` array(s) could be the result of running the weighted quick union algorithm on a set of 10 items? Check all that apply.

Recall that our weighted quick union algorithm uses union by size (number of nodes)
and not union by height.

* ```5 0 6 1 1 6 1 1 1 1``` The id[] array contains a cycle: 0->5->6->1->0
* ```9 7 0 9 0 9 9 0 9 9``` 9-3 3-8 0-4 7-1 0-7 6-8 4-2 8-5 5-4 
* ```0 2 2 0 4 0 6 7 8 9``` 2-1 0-5 3-5 
* ```1 6 6 6 8 9 8 6 8 8``` Size of tree rooted at parent of 6 < twice the size of tree rooted at 6
* ```1 3 1 3 8 5 3 4 9 3``` Height of forest `= 4 > log(N) = lg(10)`