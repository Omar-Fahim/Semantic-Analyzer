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
  @init { $val = 0; }
      : firstDigit=Digit ( ',' secondDigit=Digit totalNoOfExtremas=noOfExtermas[Integer.parseInt($firstDigit.text),Integer.parseInt($secondDigit.text)] { $val = $totalNoOfExtremas.extremas; } )?
      ;




// Write additional lexer and parser rules here

noOfExtermas[int digit1, int digit2] returns [int extremas]
@init {
  int extrema = 0;
  $extremas = 0;
}
    : ',' digit3=Digit recursiveExtermaCount=noOfExtermas[$digit2, Integer.parseInt($digit3.text)]
      {
        if (($digit1 < $digit2 && $digit2 > Integer.parseInt($digit3.text)) || ($digit1 > $digit2 && $digit2 < Integer.parseInt($digit3.text))) {
            extrema = 1;
        }
        $extremas = extrema + $recursiveExtermaCount.extremas;
      }
    | { $extremas = 0; }
    ;




Digit: [0-9];





