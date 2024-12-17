# Q is a programming language consisting of Q and q.

`[]` - Everything between these brackets is considered a comment and will be ignored by the interperter

`q` - Push character to stack

Example:
```q
q; [open append to stack]
QQqqq qqQQQ [QQqqq qqQQQ is morse code for the decimal of H]
q; [close append to stack]
```

`qq` - Print stack

Example:
```q
q;QQqqq qqQQQ q; [H]
q;qQQQQ QQQQQ qQQQQ q; [e]
q;qQQQQ QQQQQ QQQqq q; [l]
q;qQQQQ QQQQQ QQQqq q; [l]
q;qQQQQ qQQQQ qQQQQ q; [o]
q;qqqqQ qqqqQ q; [,]
q;qqqQQ qqQQQ q; [ ]
q;QQQqq QQqqq q; [W]
q;qQQQQ qQQQQ qQQQQ q; [o]
q;qQQQQ qQQQQ qqqqQ q; [r]
q;qQQQQ QQQQQ QQQqq q; [l]
q;qQQQQ QQQQQ QQQQQ q; [d]
q;qqqQQ qqqQQ q; [!]
qq;; [print stack]
```
Output:
```
Hello, World!
```

`QQ` - Clear stack
