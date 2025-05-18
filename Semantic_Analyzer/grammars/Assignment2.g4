/**
 * Write your info here
 *
 * @name Jane Smith
 * @id 52-0234
 * @tutorialNumber 06
 */

grammar Assignment2;

s returns [int val]
 // Write the definition of parser rule "s" here
  @init {
      $val = 0;
      int firstDigit = 0;
      int secondDigit = 0;
  }
      : digit { firstDigit = $digit.value; }
        (',' digit { secondDigit = $digit.value; }
         total=noOfExtermas[firstDigit, secondDigit] { $val = $total.extremas; }
        )?
      ;


// Write additional lexer and parser rules here

noOfExtermas[int firstDigit, int secondDigit] returns [int extremas]
@init {
    int extremaCount = 0;
    int previousPreviousDigit = firstDigit;
    int previousDigit = secondDigit;

}
    : (',' digit {
          int currentDigit = $digit.value;
          if ((previousPreviousDigit < previousDigit && previousDigit > currentDigit) ||
              (previousPreviousDigit > previousDigit && previousDigit < currentDigit)) {
              extremaCount++;
          }
          previousPreviousDigit = previousDigit;
          previousDigit = currentDigit;
      })+
      { $extremas = extremaCount; }
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





