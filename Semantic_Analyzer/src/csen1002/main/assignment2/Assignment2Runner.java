package csen1002.main.assignment2;

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;

public class Assignment2Runner {

    /**
     * Parses a provided string using Assignment 2's grammar
     * and gets the value of the attribute "val" of the variable "s"
     *
     * @param input a string to parse
     * @return the value of the attribute "val" of the variable "s"
     */
    public static int sValValue(String input) {
        Assignment2Lexer lexer = new Assignment2Lexer(CharStreams.fromString(input));
        Assignment2Parser parser = new Assignment2Parser(new CommonTokenStream(lexer));
        return parser.s().val;
    }

    public static void main(String[] args) {
        System.out.println(sValValue("1,4,2,5,3"));
        System.out.println(sValValue("9,8,9,7,6"));
        System.out.println(sValValue("2,4,5"));
        System.out.println(sValValue("1"));
        System.out.println(sValValue("5,0,0,7,3"));
    }
}
