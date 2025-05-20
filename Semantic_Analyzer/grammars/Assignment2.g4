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
      int d1 = 0;
      int d2 = 0;
      int d3 = 0;
  }
      : digit { d1 = $digit.value; }
        (',' digit { d2 = $digit.value; }
          (
            ',' digit { d3 = $digit.value; }
            total=noOfExtermas[d1, d2, d3] { $val = $total.extremas; }
          )?
        )?
      ;

// Write additional lexer and parser rules here

noOfExtermas[int digit1, int digit2, int digit3] returns [int extremas]
@init {
    int extremaCount = 0;
    int d1 = digit1;
    int d2 = digit2;
    int d3 = digit3;


    if ((d1 < d2 && d2 > d3) || (d1 > d2 && d2 < d3)) {
        extremaCount++;
    }
}
    : (',' digit {
          int next = $digit.value;

          d1 = d2;
          d2 = d3;
          d3 = next;

          if ((d1 < d2 && d2 > d3) || (d1 > d2 && d2 < d3)) {
              extremaCount++;
          }
      })*
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





