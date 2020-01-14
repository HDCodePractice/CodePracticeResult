let date = ask("Date")
var monthDays = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
let dateInt = Int(date) ?? 0
var totalDays = 0
if dateInt < 10000000 || dateInt > 30000000 {
    show("You have passed the calaculator's maximum capacity. Please enter a new date.")
} else {
    let y = Int(dateInt/10000)
    let m = Int((dateInt-y*10000)/100)
    let d = Int(dateInt-y*10000-m*100)
    if m > 12 {
        show("Sorry, this date does not exist. Please enter a new date.")
    } else {
        if y%4 == 0 {
            if y%100 == 0 {
                if y%400 == 0 {
                    monthDays[2] += 1
                }
            } else {
                monthDays[2] += 1
            }
        }
        if d > monthDays[m] {
            show("Sorry, this date does not exist. Please enter a new date.")
        } else {
            for i in 1 ... m {
                totalDays += monthDays[i - 1]
            }
            totalDays += d
            show("The year \(y) has passed a total of \(totalDays) days!")
        }
    }
}
