start :-
    write("\n\nEnter Integer for Factorial Computation: "),
    read(INPUT),
    computeFactorial(INPUT, ComputedResult),
    write("\n--- The factorial of "),write(INPUT),write(" is "),write(ComputedResult),write(" --- \n\n Computation Completed!\n\n").

    computeFactorial(0,1).
    computeFactorial(Integer, ComputedResult) :-
      Integer > 0,
      TempFactorial is Integer - 1,
      computeFactorial(TempFactorial, TempResult),
      ComputedResult is Integer * TempResult.
