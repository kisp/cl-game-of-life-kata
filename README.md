# cl-game-of-life-kata

Game of life kata written during code retreat @2016-10-22 (unfinished).

## Dependencies

Dependencies are installed via [quicklisp](https://www.quicklisp.org/).

## Run tests

### From CLI

```
sbcl --load load.lisp --eval '(quit)'
```

### Within Emacs

Setup [SLIME](https://www.common-lisp.net/project/slime/).
Then load ```gol.el``` and you can invoke a test run with ```C-t```
while working on ```gol.lisp```.
