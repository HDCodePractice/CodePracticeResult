var monthDay = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31, 29]
var finalResult = 0
show("Enter the date you are going to ask:")
let dateString = ask("date")
let dateNumber = abs(Int(dateString) ?? 0)
let year = dateNumber / 10000
let date = dateNumber - dateNumber / 100 * 100
var month = (dateNumber - year * 10000 - date) / 100 
if dateNumber - (dateNumber / 10000 * 10000) < 100 || month > 12{
    show("Please enter a correct date.")
} else {
    if year % 4 == 0 && month > 2 {
        finalResult += 1
    }
    for i in 1 ... month {
        finalResult += monthDay[i - 1]
    }
    finalResult += date
    if date > monthDay[month] || date == 0 {
        if month == 2 && year % 4 == 0 && date < 29{
            show("\(year) has passed \(finalResult) days.")
        }else{
            show("Sorry, the value is not correct because date does not exist.")
        }
    }else {
        show("\(year) has passed \(finalResult) days.")
    }
}

/*show(dateNumber ?? 0)
show(year)
show(date)
show(month)
show(finalResult)
 */
