initial(state(e,e,e,e)).
final(state(w,w,w,w)).

farmer :-
  go(state(e,e,e,e), state(w,w,w,w)).

  go(Start, Goal) :-
    empty_queue(Empty_open_queue),
    enqueue([Start, nil], Empty_open_queue, Open_queue),
    empty_set(Closed_set),
    path(Open_queue, Closed_set, Goal).

  empty_queue([]).
  empty_set([]).

  path(Open_queue, _, _) :-
    empty_queue(Open_queue),
    write('No solution found!'), fail.
  path(Open_queue, Closed_set, Goal) :-
    dequeue([State, Parent], Open_queue, _),
    State = Goal,
    write('Solution path is: '), nl,
    printsolution([State, Parent], Closed_set).
  path(Open_queue, Closed_set, Goal) :-
    dequeue([State, Parent], Open_queue, Rest_open_queue),
    get_children(State, Rest_open_queue, Closed_set, Children),
    add_list_to_queue(Children, Rest_open_queue, New_open_queue),
    union([[State, Parent]], Closed_set, New_closed_set),
    path(New_open_queue, New_closed_set, Goal), !.

  add_list_to_queue(List, Queue, Newqueue) :-
  	append(Queue, List, Newqueue).

  printsolution([State, nil], _) :-
    write(State), nl.
  printsolution([State, Parent], Closed_set) :-
    member_set([Parent, Grandparent], Closed_set),
    printsolution([Parent, Grandparent], Closed_set),
    write(State), nl.

  enqueue(E, [], [E]).
  enqueue(E, [H | T], [H | Tnew]) :-
    enqueue(E, T, Tnew).

  dequeue(E, [E | T], T).

  get_children(State, Rest_open_queue, Closed_set, Children) :-
    bagof(Child, moves(State, Rest_open_queue, Closed_set, Child), Children);
    Children = [].

  moves(State, Rest_open_queue, Closed_set, [Next, State]) :-
    move(State, Next),
    not(member_queue([Next, _], Rest_open_queue)),
    not(member_set([Next, _], Closed_set)).

  member_queue([State, Parent], [[State, Parent] | _]).
  member_queue(X, [_ | T]) :-
  	member_queue(X, T).

  member_set([State, Parent], [[State, Parent] | _]).
  member_set(X, [_ | T]) :-
    member_set(X, T).

  move(state(X, G, X, C), state(Y, G, Y, C)) :-
    opp(X,Y),
    not(unsafe(state(Y,G,Y,C))),
    nl, write('Farmer attempts to take Wolf across ').
  move(state(X, X, W, C), state(Y, Y, W, C)) :-
    opp(X,Y),
    not(unsafe(state(Y,Y,W,C))),
    nl, write('Farmer attempts to take Goat across ').
  move(state(X, G, W, X), state(Y, G, W, Y)) :-
    opp(X,Y),
    not(unsafe(state(Y,G,W,Y))),
    nl, write('Farmer attempts to take Cabbage across ').
  move(state(X, G, W, C), state(Y, G, W, C)) :-
    opp(X,Y),
    not(unsafe(state(Y,G,W,C))),
    nl, write('Farmer crosses alone ').
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
  member(X, [_ | T]) :-
    member(X, T).
