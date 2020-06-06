start :-
  write("Enter a List of Numbers: "),
  read(LIST), write("\n"),
  write("Enter Number to Find in List: "),
  read(NUM),write("\n"),
  write("\nRecieved!\n"),
  searchList(NUM, LIST, 0, []).
  /*searchList - If the list array has been gone through, print out RES*/
  searchList(NUM, [], _, RES) :-
    write("\nThe following is a list of Positions of - "),write(NUM),write(" - within the given List: "),
    write("["),outputList(RES).
  /*searchList - If the given integer of NUM is found in the front of the list, add NUM into new return list*/
  searchList(NUM, [NUM|END], POS, Result) :-
    NewPOS is POS + 1,
    addtoList(Result, NewPOS, NewResult),
    searchList(NUM, END, NewPOS, NewResult).
  /*searchList - If the value at the front of the list DOES NOT equal to the given NUM, continue down the list*/
  searchList(NUM, [_|END], POS, Result) :-
    NewPOS is POS + 1,
    searchList(NUM, END, NewPOS, Result).

  /*outputList - If there is one element left in the list, write out that element and close the new list*/
  outputList([Beg|[]]) :-
    write(Beg),write("]"),write("\n\nDone!\n\n").
  /*outputList - If there is more than one element in the list, write out the first element and continue traversing the list*/
  outputList([Beg|END]) :-
    write(Beg), write(", "),
    outputList(END).
  /*addtoList - If the result list is empty, place the POS at the end of the new resulting list */
  addtoList([], POS, [POS]).
  /*addtoList - The beginning of the result list will be placed into a new list so that the new POS can be placed at the end of the new list*/
  addtoList([Res|END], POS, [Res|NewRes]) :-
    addtoList(END, POS, NewRes).
