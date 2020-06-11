edgCost(a, b, 3).
edgCost(b, c, 1).
edgCost(b, d, 5).
edgCost(d, b, 2).
edgCost(c, d, 2).



start :-
  write("|---------------------------------------------------------------------------|\n"),
  write("|                                   b                                       |\n"),
  write("|                         (a->b=3)     (b->c=1)                             |\n"),
  write("|                      a     (b->d=5)(d->b=2)     c                         |\n"),
  write("|                                      (c->d=2)                             |\n"),
  write("|                                   d                                       |\n"),
  write("|---------------------------------------------------------------------------|\n"),
  write("| Using the graph above, please input the Start & End nodes for calculation |\n"),
  write("|---------------------------------------------------------------------------|\n"),
  write("|  Start Node: "),
  read(BNODE),
  write("\n| End Node: "),
  read(ENODE),
  write("\n|                  Calculating Shortest Route!                              |\n\n\n"),
  findMinPath(BNODE,ENODE).

  findMinPath(B, E) :-
    checkPath(B, [E], 0, PATH, COST),
    not(checkShorterPath(B, E, COST)),
    write("The Path from "), write(B), write(" to "), write(E), write(": ["),
    displayPath(PATH, COST, E).

  checkPath(B, [B | ARR], COST, [B | ARR], COST).
  checkPath(B, [E | ARR], TCOST, PATH, COST) :-
    edgCost(X, E, EdgCOST),
    not(isMember(X, ARR)),
    NCOST is EdgCOST + TCOST,
    checkPath(B, [X, E | ARR], NCOST, PATH, COST).

  checkShorterPath(B, E, COST) :-
    checkPath(B, [E], 0, _, COST2),
    COST2 < COST.

  isMember(X , [X | _]).
  isMember(X, [_ | ARR]) :-
    isMember(X, ARR).

  displayPath([E|_], COST, E) :-
    write(E),write("] - Cost is "),write(COST).
  displayPath([X|Y], COST, E) :-
    write(X),write(","),
    displayPath(Y, COST, E).
