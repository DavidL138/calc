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
                        var pResult: Int = 0;
                        switch(args[index + 2]) {
                            case "x":
                                pResult = multiply(no1: Int(args[index + 1])!, no2: Int(args[index + 3])!);
                            case "/":
                                pResult = divide(no1: Int(args[index + 1])!, no2: Int(args[index + 3])!);
                            case "%":
                                pResult = modulus(no1: Int(args[index + 1])!, no2: Int(args[index + 3])!);
                            default:
                                break;
                        }
                        currentResult = add(no1: currentResult, no2: pResult);
                        index += 3;
                        continue;
                    }
                    currentResult = add(no1: currentResult, no2: Int(args[index + 1])!);
                case "-":
                    if (index + 2 < args.count && precOperators.contains(args[index + 2])) {
                        var pResult: Int = 0;
                        switch(args[index + 2]) {
                            case "x":
                                pResult = multiply(no1: Int(args[index + 1])!, no2: Int(args[index + 3])!);
                            case "/":
                                pResult = divide(no1: Int(args[index + 1])!, no2: Int(args[index + 3])!);
                            case "%":
                                pResult = modulus(no1: Int(args[index + 1])!, no2: Int(args[index + 3])!);
                            default:
                                break;
                        }
                        currentResult = subtract(no1: currentResult, no2: pResult);
                        index += 3;
                        continue;
                    }
                    currentResult = subtract(no1: currentResult, no2: Int(args[index + 1])!);
                default:
                    break;
            }
            index += 1;
        }
        let result = String(currentResult);
        return(result);
    }
}
