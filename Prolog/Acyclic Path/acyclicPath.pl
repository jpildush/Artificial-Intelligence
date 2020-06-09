start:-
  write("Please enter a graph (i.e. - graph([(a,b),(b,c),(c,d),(d,c),(c,b),(b,a)])):  "),
  read(GRAPH),
  write("\n\nPlease enter the start node: "),
  read(START),
  write("\n\nPlease enter the end node: "),
  read(END),
  getPath(GRAPH, START, END, []).

getPath(_, X, X, PATH):-
  write("\n\nPath is: ["),
  displayPath([X|PATH], X).

getPath(graph(GRAPH), START, END, PATH) :-
  isMember((START,X), GRAPH),
  not(isMember(X, PATH)),
  getPath(graph(GRAPH), X, END, [START|PATH]).

displayPath([], _).
displayPath([X|END], X):-
  displayPath(END, X),
  write(X), write("]\n\n"),
  write("Path displayed above! \n\n").
displayPath([BEG|END], X):-
  displayPath(END, X),
  write(BEG), write("->").

isMember(X, [X|_]).
isMember(X, [_|END]):-
  isMember(X, END).
