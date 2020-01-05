let randomNumber = Int.random(in:0...999)
var answer = 500
var time = 0
func number() -> Int{
    if 1000/Int(NSDecimalNumber(decimal: pow(2,time + 1))) > 1{
        return 1000/Int(NSDecimalNumber(decimal: pow(2,time + 1)))
    } else {
        return 1
    }
}
while answer != randomNumber{
    time += 1
    if answer < randomNumber{
        show("the answer is \(answer), larger than you expected, it is the \(time) time")
        answer += number()
    }else if answer > randomNumber{
        show("the answer is \(answer), smaller than you expected, it is the \(time) time")
        answer -= number()
    }
}
show("yes, the number is \(randomNumber), you have use \(time) time to solve it")





//  let randomNumber = Int.random(in:0...999)
//  var answer = 0
//  var time = 0
//// answer0 = NSDecimalNumber(decimal: pow(2,time-1))
//  
//  while answer != randomNumber{
//      time += 1
//      var answer1 = 1000/Int(NSDecimalNumber(decimal: pow(2,time))) + answer
//      if answer1 < randomNumber{
//          show("the answer is larger than you expected, it is the \(time) time")
//          answer = answer1
//      }else if answer1 > randomNumber{
//          show("the answer is smaller than you expected, it is the \(time) time")
//      }
//      answer = answer1
//  }
//  show("yes, the number is \(randomNumber), you have use \(time) time to solve it")
//  500
//  250
//  125
//  62
//  31
//  15
//  7
//  3
//  1
//  
//  
