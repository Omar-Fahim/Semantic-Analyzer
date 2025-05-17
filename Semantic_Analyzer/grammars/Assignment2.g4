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
      : firstDigit=Digit totalNoOfExtremas=remainingSequence[Integer.parseInt($firstDigit.text)] { $val = $totalNoOfExtremas.count; }
      ;



// Write additional lexer and parser rules here



remainingSequence[int firstDigit] returns [int count]
@init { $count = 0; }
    : ',' secondDigit=Digit totalNoofExtremas=extermaCount[$firstDigit, Integer.parseInt($secondDigit.text)] { $count = $totalNoofExtremas.count; }
    | { $count = 0; }

;



extermaCount[int digit1, int digit2] returns [int count]
@init {
  int extrema = 0;
  $count = 0;
}
    : ',' digit3=Digit recursiveExtermaCount=extermaCount[$digit2, Integer.parseInt($digit3.text)]
      {
        if (($digit1 < $digit2 && $digit2 > Integer.parseInt($digit3.text)) || ($digit1 > $digit2 && $digit2 < Integer.parseInt($digit3.text))) {
            extrema = 1;
        }
        $count = extrema + $recursiveExtermaCount.count;
      }
    | { $count = 0; }
    ;




Digit: [0-9];
WS: [ \t\r\n]+ -> skip;




