vowels(a).
vowels(e).
vowels(u).
vowels(i).
vowels(o).
vowels(y).

start:-
  write("Please enter the word to split up: "),
  read(WORD),
  string_chars(WORD, WORDLIST),
  splitWord(WORD, WORDLIST).

splitWord(WORD, WORDLIST) :-
  split(WORD, WORDLIST,SPLITWORD),
  write("\n\n\nSplit completed! \n\n\nOriginal word: "),
  write(WORD),
  write("\nNew split word: "),
  displaySPLIT(SPLITWORD),
  write("\n\nSplit Displayed Above!\n\n").

split(_, [], _).


split(WORD, [CHAR1, CHAR2, CHAR3 | WORDLIST], [CHAR1, CHAR2, CHAR3, '-' | SPLITWORD]) :-
  vowels(CHAR1),
  not(vowels(CHAR2)),
  vowels(CHAR3),
  split(WORD, WORDLIST, SPLITWORD).

split(WORD, [CHAR1, CHAR2, CHAR3, CHAR4 | WORDLIST], [CHAR1, CHAR2, '-', CHAR3, CHAR4 | SPLITWORD]) :-
  vowels(CHAR1),
  not(vowels(CHAR2)),
  not(vowels(CHAR3)),
  vowels(CHAR4),
  split(WORD, WORDLIST, SPLITWORD).

split(WORD, [CHAR | WORDLIST], [CHAR | SPLITWORD]) :-
  split(WORD, WORDLIST, SPLITWORD).

displaySPLIT([]).
displaySPLIT([BEG|END]) :-
  write(BEG),
  displaySPLIT(END).
