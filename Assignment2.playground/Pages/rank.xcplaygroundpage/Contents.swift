
import Foundation

func rank(array: [Int], target: Int) -> Int {
    
    var left = 0
    var right = array.count - 1
    
    while (left <= right) {
        let mid = (left + right) / 2
        let value = array[mid]
        
        if (value == target) {
            return mid
        }
        
        if (value < target) {
            left = mid + 1
        }
        
        if (value > target) {
            right = mid - 1
        }
    }
    
    return -1
}

let input1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11]

assert(rank(input1, target: 3) == 2)
assert(rank(input1, target: 7) == 6)
assert(rank(input1, target: 11) == 10)
assert(rank(input1, target: 0) == -1)


let input2: [Int] = [];
assert(rank(input2, target: 1) == -1)



//: [Next](@next)

