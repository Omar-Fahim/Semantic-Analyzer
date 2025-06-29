/**
 * Write your info here
 *
 * @name Omar Adel Fahim Shaaban
 * @id 52-4471
 * @tutorialNumber 10
 */

grammar Assignment2;

s returns [int val]

 // Write the definition of parser rule "s" here
  @init {
      $val = 0;
      int firstDigit  = 0;
      int secondDigit  = 0;
      int thirdDigit = 0;
  }
      : digit { firstDigit = $digit.value; }
        (',' digit { secondDigit = $digit.value; }
          (
            ',' digit { thirdDigit = $digit.value; }
            totalExtermas=noOfExtermas[firstDigit, secondDigit, thirdDigit] { $val = $totalExtermas.extremas; }
          )?
        )?
      ;

// Write additional lexer and parser rules here

noOfExtermas[int digit1, int digit2, int digit3] returns [int extremas]
@init {
    int noOfExtremas = 0;
    int firstDigit = digit1;
    int secondDigit = digit2;
    int thirdDigit = digit3;


    if ((firstDigit < secondDigit && secondDigit > thirdDigit) || (firstDigit > secondDigit && secondDigit < thirdDigit)) {
        noOfExtremas++;
    }
}
    : (',' digit {
          int newDigit = $digit.value;

          firstDigit = secondDigit;
          secondDigit = thirdDigit;
          thirdDigit = newDigit;

          if ((firstDigit < secondDigit && secondDigit > thirdDigit) || (firstDigit > secondDigit && secondDigit <thirdDigit)) {
              noOfExtremas++;
          }
      })*
      { $extremas = noOfExtremas; }
    | { $extremas = 0; }
    ;


digit returns [int value]
    : '0' { $value = 0; }
    | '1' { $value = 1; }
    | '2' { $value = 2; }
    | '3' { $value = 3; }
    | '4' { $value = 4; }
    | '5' { $value = 5; }
    | '6' { $value = 6; }
    | '7' { $value = 7; }
    | '8' { $value = 8; }
    | '9' { $value = 9; }
    ;





