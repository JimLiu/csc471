//: [Previous](@previous)

import Foundation


class Fraction {
    var numerator: Int = 0
    var denominator: Int = 1
    
    init(_ numerator: Int, over denominator: Int) {
        // Check the denominator
        assert(denominator != 0, "Denominator cannot be zero")
        self.numerator = numerator
        self.denominator = denominator
    }
    
    init() {}
    
    func setTo(numerator: Int, over denominator: Int) {
        self.numerator = numerator
        self.denominator = denominator
    }
    
    func printFraction() {
        print("\(numerator)/\(denominator)")
    }
    
    func toDouble() -> Double {
        return Double(numerator) / Double(denominator);
    }
    
    /**
     Adds a fraction to self.
     
     :param: f Fraction to add to self
     
     :returns: Fraction The result of adding f to self.
     */
    func add(f: Fraction) -> Fraction {
        let result = Fraction()
        result.numerator = numerator * f.denominator + denominator * f.numerator
        result.denominator = denominator * f.denominator
        result.reduce()
        return result
    }
    
    /**
     Subtracts fraction from self.
     
     :param: f Fraction to subtract from self
     
     :returns: Fraction The result of subtracting f from self.
     */
    func subtract(f: Fraction) -> Fraction {
        let result = Fraction()
        result.numerator = numerator * f.denominator - denominator * f.numerator
        result.denominator = denominator * f.denominator
        result.reduce()
        return result
    }
    
    /**
     Multiplies self by a fraction.
     
     :param: f Fraction to multiply self by
     
     :returns: Fraction The result of multiplying self by f.
     */
    func multiply(f: Fraction) -> Fraction {
        let result = Fraction()
        result.numerator = numerator * f.numerator
        result.denominator = denominator * f.denominator
        result.reduce()
        return result
    }
    
    /**
     Divides self by a fraction.
     
     :param: f Fraction to divide self by
     
     :returns: Fraction The result of dividing self by f.
     */
    func divide(f: Fraction) -> Fraction {
        let result = Fraction()
        result.numerator = numerator * f.denominator
        result.denominator = denominator * f.numerator
        result.reduce()
        return result
    }
    
    
    func reduce() {
        let sign = numerator >= 0 ? 1 : -1
        var u = numerator * sign
        var v = denominator
        var r: Int
        while (v != 0) {
            r = u % v
            u = v
            v = r
        }
        numerator /= u;
        denominator /= u;
    }
    
    
    /**
     Add a fraction to fraction.
     
     :param: f1 Fraction to add to
     :param: f2 Fraction to be added
     
     :returns: The result of f1 + f2.
     */
    static func add(f1: Fraction, to f2: Fraction) -> Fraction {
        return f1.add(f2);
    }
    
    /**
     Subtract a fraction from fraction.
     
     :param: f1 Fraction to subtract
     :param: f2 Fraction to subtract from
     
     :returns: The result of f2 - f1.
     */
    static func subtract(f1: Fraction, from f2: Fraction) -> Fraction {
        return f2.subtract(f1);
    }
    
    /**
     Multiply a fraction by fraction.
     
     :param: f1 Fraction to multiply
     :param: f2 Fraction to multiply by
     
     :returns: The result of f1*f2.
     */
    static func multiply(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.multiply(f2)
    }
    
    /**
     Divide a fraction by fraction.
     
     :param: f1 Fraction to divide
     :param: f2 Fraction to divide by
     
     :returns: The result of f1/f2.
     */
    static func divide(f1: Fraction, by f2: Fraction) -> Fraction {
        return f1.divide(f2)
    }
    
}

/**
 + operator between two Fractions
 */
func +(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.add(f2)
}

/**
 - operator between two Fractions
 */
func -(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.subtract(f2)
}

/**
 * operator between two Fractions
 */
func *(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.multiply(f2)
}

/**
 / operator between two Fractions
 */

func /(f1: Fraction, f2: Fraction) -> Fraction {
    return f1.divide(f2)
}

let f1 = Fraction(1, over: 2)
let f2 = Fraction(1, over: 4)
var result: Fraction


result = f1.add(f2)
assert(result.numerator == 3)
assert(result.denominator == 4)
result.printFraction()

result = f1 + f2
assert(result.numerator == 3)
assert(result.denominator == 4)
result.printFraction()


result = Fraction.add(f1, to: f2)
assert(result.numerator == 3)
assert(result.denominator == 4)
result.printFraction()


result = Fraction.add(f1, to: f1)
assert(result.numerator == 1)
assert(result.denominator == 1)
result.printFraction()



result = f1.subtract(f2)
assert(result.numerator == 1)
assert(result.denominator == 4)
result.printFraction()


result = f1 - f2
assert(result.numerator == 1)
assert(result.denominator == 4)
result.printFraction()

result = Fraction.subtract(f2, from: f1)
assert(result.numerator == 1)
assert(result.denominator == 4)
result.printFraction()

result = f2.subtract(f1)
assert(result.numerator == -1)
assert(result.denominator == 4)
result.printFraction()


result = f1.multiply(f2)
assert(result.numerator == 1)
assert(result.denominator == 8)
result.printFraction()


result = f1 * f2
assert(result.numerator == 1)
assert(result.denominator == 8)
result.printFraction()

result = Fraction.multiply(f1, by: f2)
assert(result.numerator == 1)
assert(result.denominator == 8)
result.printFraction()



result = f1.divide(f2)
assert(result.numerator == 2)
assert(result.denominator == 1)
result.printFraction()


result = f1 / f2
assert(result.numerator == 2)
assert(result.denominator == 1)
result.printFraction()

result = Fraction.divide(f1, by: f2)
assert(result.numerator == 2)
assert(result.denominator == 1)
result.printFraction()


result = f2.divide(f1)
assert(result.numerator == 1)
assert(result.denominator == 2)
result.printFraction()

