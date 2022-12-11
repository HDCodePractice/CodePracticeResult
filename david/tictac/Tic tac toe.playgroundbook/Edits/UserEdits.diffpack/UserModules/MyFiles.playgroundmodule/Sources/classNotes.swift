
struct Person{
    var name:String
    var gender: String
    var location:String
    var level: Int
    var duration:Int
    var isGraduate:Bool
    var isTerm:Bool
    var lines: Int = 0
    
    mutating func practise(lines:Int){
        
        duration += lines/100
        level += duration/100
        
    }
}

var persons:[Person]=[
    Person(name: "B", gender: "M", location: "A", level: 0, duration: 0, isGraduate: false, isTerm: false),
    Person(name: "T", gender: "M", location: "C", level: 0, duration: 0, isGraduate: false, isTerm: false),
    Person(name: "D", gender: "M", location: "B", level: 0, duration: 0, isGraduate: false, isTerm: false)
    
]
//show("\(foods)")


for person in persons{
    show("\(person.duration)\(person.gender) \(person.level) \(person.lines)\(person.lines)\(person.location)\(person.isGraduate)\(person.isTerm)")
}
var b = [10,30,90]
for j in 0..<persons.count{
    for i in 0...2{
        person[j].lines += b.randomElement()!
    }
    
}


// 定一个struct 叫 人
// 人 有 三个属性： 名字、性别、居住地、Coding级别、学习时间、是否幼儿园毕业、是否以完成过一期学习、书写过的代码行数
// 人 有 一个方法： 练习（代码行数：Int）：为现在的代码行数增加Int行，如果每100行代码还会增加1小时学习时间，同时如果累计学习时间超过100小时，Coding级别增加一级
// 定义一个数组，名为 学生们， 里面有 Bernie、Tian、Divid
// 我们可以显示出所有的学生信息
// 为每个学生增加3次随机数为10/30/90的代码练习行数
// 再次显示出所有的学生信息


struct Person {
    var name : String
    var gender : String = "m"
    var state : String 
    var codingLevel : Int = 0
    var learningTime : Int = 0
    var graduated: Bool = false
    var isSemester: Bool = false
    var lines: Int = 0
    
    mutating func practice(linesAdded: Int){
        lines += linesAdded
        learningTime = lines/100
        codingLevel = learningTime/100
    }
}

var students:[Person]=[
    Person(name: "Bernie", gender: "m", state: "MA", graduated: true, isSemester: true),
    Person(name: "Tian", gender: "m", state: "TX", graduated: true, isSemester: true),
    Person(name: "David", gender: "m", state: "CA", graduated: true, isSemester: true)
]

func showStudents(students:[Person]){
    for student in students{
        show("\(student.name) \(student.gender) \(student.state) Level: \(student.codingLevel) Time:\(student.learningTime) graduated:\(student.graduated) isSemester:\(student.isSemester) lines:\(student.lines) ")
    }
}
//老师代码
showStudents(students: students)
for i in 1...3{
    show("===============\(i)=================")
    for index in 0..<students.count{
        students[index].practice(linesAdded: [100,3000,90000].randomElement()!)
    }
    showStudents(students: students)
}
