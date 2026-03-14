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
        let validator = Validator();
        let isValidInput: Bool = validator.validate(args: args);
        if (isValidInput == false) {
            exit(1);
        }
    
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
                    if (index + 2 < args.count && precOperators.contains(args[index + 2])) {
                        var pResult: Int = Int(args[index + 1])!;
                        var pIndex = index + 2;
                        
                        while (pIndex < args.count && precOperators.contains(args[pIndex])) {
                            let nextVal = Int(args[pIndex + 1])!;
                            
                            switch(args[pIndex]) {
                                case "x":
                                    pResult = multiply(no1: pResult, no2: nextVal);
                                case "/":
                                    pResult = divide(no1: pResult, no2: nextVal);
                                case "%":
                                    pResult = modulus(no1: pResult, no2: nextVal);
                                default:
                                    break;
                            }
                            
                            pIndex += 2;
                        }
                        
                        currentResult = add(no1: currentResult, no2: pResult);
                        index = pIndex - 1;
                        continue;
                    }
                    
                    currentResult = add(no1: currentResult, no2: Int(args[index + 1])!);
                case "-":
                    if (index + 2 < args.count && precOperators.contains(args[index + 2])) {
                        var pResult: Int = Int(args[index + 1])!;
                        var pIndex = index + 2;
                        
                        while (pIndex < args.count && precOperators.contains(args[pIndex])) {
                            let nextVal = Int(args[pIndex + 1])!;
                            
                            switch(args[pIndex]) {
                                case "x":
                                    pResult = multiply(no1: pResult, no2: nextVal);
                                case "/":
                                    pResult = divide(no1: pResult, no2: nextVal);
                                case "%":
                                    pResult = modulus(no1: pResult, no2: nextVal);
                                default:
                                    break;
                            }
                            
                            pIndex += 2
                        }
                        
                        currentResult = subtract(no1: currentResult, no2: pResult);
                        index = pIndex - 1;
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
