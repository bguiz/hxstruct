## Haxe Struct

General purpose data structures and algorithms written in Haxe.

[Haxe](http://haxe.org/)
transpiles or compiles to many target languages and platforms.

## Data Structures

- [x] Dictionary
  - [x] Array Bag
  - [x] List Bag
  - [x] Array Stack
  - [x] List Stack
  - [x] Array Queue
  - [x] List Queue
- [ ] Priority Queue
  - [x] Array Unordered Priority Queue
  - [ ] Array Ordered Priority Queue
  - [x] Binary Heap Priority Queue
  - [ ] N-ary Heap Priority Queue
  - [ ] Fibonacci Heap Priority Queue
- [ ] Search Tree
  - [ ] List Unordered Symbol Table
  - [ ] Array Ordered Symbol Table
  - [x] Binary Search Tree
  - [ ] 2-3 Search Tree
    - [x] Left Leaning Red-Black Binary Search Tree
  - [ ] B Tree
  - [ ] B+ Tree
- [ ] Hash Table
  - [ ] List Unordered Hash Table
  - [ ] Array Ordered Hash Table
  - [ ] Binary Search Tree Hash Table
  - [ ] Red-Black Binary Search Tree Hash Table
  - [x] Separate Chaining Hash Table
  - [ ] Linear Probing Hash Table

## Algorithms

- [ ] Sort
  - [x] Array Comparator Network Sort
  - [x] Array Bubble Sort
  - [x] Array Selection Sort
  - [x] Array Insertion Sort
  - [x] Array Shell Sort
  - [X] Array Merge Sort
    - [x] Array Bottom Up Merge Sort
  - [x] Array Quick Sort
    - [x] Array Three Way Quick Sort
  - [ ] Binary Heap Sort
- [x] Shuffle
  - [x] Sort Shuffle
  - [x] Knuth Shuffle
- [ ] Select
  - [x] Array Quick Select
  - [ ] Array Binary Search

## Tests

Run the unit tests using
[Massive Unit](http://github.com/massiveinteractive/MassiveUnit).

```bash
haxelib run munit test
```

If you wish to run tests against just one target,
say Javascript,
simply add the target name to the end, like so:

```bash
haxelib run munit test -js
```

You can find the full list of available platforms
in `test.hxml`, which is the configuration file
used by the Haxe compiler when running Massive Unit.

If you wish to run tests against the C++ target,
you will need to install HXCPP first.

```bash
haxelib install hxcpp
haxelib run munit test -cpp
```

## Author

[Brendan Graetz](http://bguiz.com/)

## Licence

GPL-3.0
