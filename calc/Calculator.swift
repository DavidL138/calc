//
//  Calculator.swift
//  calc
//
//  Created by david on 16/12/1404 AP.
//  Copyright © 1404 AP UTS. All rights reserved.
//

import Foundation

class Calculator {
    var currentResult = 0;
    
    func add(no1: Int, no2: Int) -> Int {
        return no1 + no2;
    }
    
    func subtract(no1: Int, no2: Int) -> Int {
        return no1 - no2;
    }
    
    func multiply(no1: Int, no2: Int) -> Int {
        return no1 * no2;
    }
    
    func divide(no1: Int, no2: Int) -> Int {
        return no1 / no2;
    }
    
    func modulus(no1: Int, no2: Int) -> Int {
        return no1 % no2;
    }

    
    func calculate(args: [String]) -> String {
        
        // input validation
        let validator = Validator();
        do {
            try validator.validate(args: args);
        } catch InvalidInputError.incompleteExpression {
            print("Incomplete expression. Expected input of the form [number] [operator number ...]");
            exit(1);
        } catch InvalidInputError.unknownOperator(let unknownOperator) {
            print("Unknown Operator: \(unknownOperator)");
            exit(1);
        } catch InvalidInputError.invalidNumber(let invalidNumber) {
            print("Invalid Number: \(invalidNumber)");
            exit(1);
        }
        catch {
            print("Unexpected error");
        }
        
        //  calculation code
        let precOperators: [String] = ["x", "/", "%"];
        var currentResult: Int = Int(args[0])!;
        var index: Int = 1;
        while index < args.count {
            switch (args[index]) {
                case "x":
                    currentResult = multiply(no1: currentResult, no2: Int(args[index + 1])!);
                case "/":
                    currentResult = divide(no1: currentResult, no2: Int(args[index + 1])!);
                case "%":
                    currentResult = modulus(no1: currentResult, no2: Int(args[index + 1])!);
                case "+":
                    // calculates all following expressions with a higher ordered operator if one is found after this operator
                    if (index + 2 < args.count && precOperators.contains(args[index + 2])) {
                        var precOpResult: Int = Int(args[index + 1])!;
                        var precOpIndex = index + 2;
                        
                        while (precOpIndex < args.count && precOperators.contains(args[precOpIndex])) {
                            let nextVal = Int(args[precOpIndex + 1])!;
                            
                            switch(args[precOpIndex]) {
                                case "x":
                                    precOpResult = multiply(no1: precOpResult, no2: nextVal);
                                case "/":
                                    precOpResult = divide(no1: precOpResult, no2: nextVal);
                                case "%":
                                    precOpResult = modulus(no1: precOpResult, no2: nextVal);
                                default:
                                    break;
                            }
                            
                            precOpIndex += 2;
                        }
                        
                        currentResult = add(no1: currentResult, no2: precOpResult);
                        index = precOpIndex - 1;
                        continue;
                    }
                if (index + 1 < args.count) {
                    currentResult = add(no1: currentResult, no2: Int(args[index + 1])!);
                }
                case "-":
                    // calculates all following expressions with a higher ordered operator if one is found after this operator
                    if (index + 2 < args.count && precOperators.contains(args[index + 2])) {
                        var precOpResult: Int = Int(args[index + 1])!;
                        var precOpIndex = index + 2;
                        
                        while (precOpIndex < args.count && precOperators.contains(args[precOpIndex])) {
                            let nextVal = Int(args[precOpIndex + 1])!;
                            
                            switch(args[precOpIndex]) {
                                case "x":
                                    precOpResult = multiply(no1: precOpResult, no2: nextVal);
                                case "/":
                                    precOpResult = divide(no1: precOpResult, no2: nextVal);
                                case "%":
                                    precOpResult = modulus(no1: precOpResult, no2: nextVal);
                                default:
                                    break;
                            }
                            
                            precOpIndex += 2
                        }
                        
                        currentResult = subtract(no1: currentResult, no2: precOpResult);
                        index = precOpIndex - 1;
                        continue;
                    }
                    
                    currentResult = subtract(no1: currentResult, no2: Int(args[index + 1])!)
                default:
                    break;
            }
            index += 1;
        }
        let result = String(currentResult);
        return(result);
    }
}
