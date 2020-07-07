initial(state(e,e,e,e)).
final(state(w,w,w,w)).

farmer :-
  go(state(e,e,e,e), state(w,w,w,w)).

  go(Start, Goal) :-
    empty_stack(Empty_open),
    stack([Start,nil], Empty_open, Open_stack),
    empty_set(Closed_set),
    path(Open_stack, Closed_set, Goal).

  empty_stack([]).
  empty_set([]).

  path(Open_stack, _, _) :-
    empty_stack(Open_stack),
    write('No solution found!'), fail.
  path(Open_stack, Closed_set, Goal) :-
    stack([State, Parent], _, Open_stack),
    State = Goal,
    nl, write('Solution path is: '), nl,
    printsolution([State, Parent], Closed_set).
  path(Open_stack, Closed_set, Goal) :-
    stack([State, Parent], Rest_open_stack, Open_stack),
    get_children(State, Rest_open_stack, Closed_set, Children),
    add_list_to_stack(Children, Rest_open_stack, New_open_stack),
    union([[State, Parent]], Closed_set, New_closed_set),
    path(New_open_stack, New_closed_set, Goal).

  stack(Top, Stack, [Top | Stack]).

  add_list_to_stack(List, Stack, Result) :-
    append(List, Stack, Result).

  printsolution([State, nil], _) :-
    write(State), nl.
  printsolution([State, Parent], Closed_set) :-
    member_set([Parent, Grandparent], Closed_set),
    printsolution([Parent, Grandparent], Closed_set),
    write(State), nl.

  get_children(State, Rest_open_stack, Closed_set, Children) :-
    bagof(Child, moves(State, Rest_open_stack, Closed_set, Child), Children);
    Children = [].

  moves(State, Rest_open_stack, Closed_set, [Next, State]) :-
    move(State, Next),
    not(member_stack([Next, _], Rest_open_stack)),
    not(member_set([Next, _], Closed_set)).

  member_stack([State, Parent], [[State, Parent] | _]).
  member_stack(X, [_ | T]) :-
    member_stack(X, T).

  member_set([State, Parent], [[State, Parent] | _]).
  member_set(X, [_ | T]) :-
    member_set(X, T).

  move(state(X, G, X, C), state(Y, G, Y, C)) :-
    opp(X,Y),
    not(unsafe(state(Y,G,Y,C))),
    nl,
    write('Farmer attempts to take Wolf across').
  move(state(X, X, W, C), state(Y, Y, W, C)) :-
    opp(X,Y),
    not(unsafe(state(Y,Y,W,C))),
    nl,
    write('Farmer attempts to take Goat across').
  move(state(X, G, W, X), state(Y, G, W, Y)) :-
    opp(X,Y),
    not(unsafe(state(Y,G,W,Y))),
    nl,
    write('Farmer attempts to take Cabbage across').
  move(state(X, G, W, C), state(Y, G, W, C)) :-
    opp(X,Y),
    not(unsafe(state(Y,G,W,C))),
    nl,
    write('Farmer crosses alone').
  move(state(F,G,W,C), state(F,G,W,C)):-
    nl,nl,writelist(['- Further depth traversal not possible - Backtrack - ',F,G,W,C]), nl,fail.

  unsafe(state(X, Y, Y, _)) :-
    opp(X, Y).
  unsafe(state(X, Y, _, Y)) :-
    opp(X, Y).

  opp(e, w).
  opp(w, e).

  writelist([]).
  writelist([BEG | END]) :-
    write(BEG),
    write(' '),
    writelist(END).

  union([], S, S).
  union([BEG | END], S, S_new) :-
    union(END, S, S2),
    add_if_not_in_set(BEG, S2, S_new), !.

  add_if_not_in_set(X, S, S) :-
    member(X, S), !.
  add_if_not_in_set(X, S, [X | S]).

  delete_if_in_set(_, [], []).
  delete_if_in_set(E, [E | T], T) :- !.
  delete_if_in_set(E, [H | T], [H | T_new]) :-
    delete_if_in_set(E, T, T_new), !.

  member(X, [X | _]).
  member(X, [_ | END]) :-
    member(X, END).
