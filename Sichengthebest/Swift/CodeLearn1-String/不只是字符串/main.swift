let name = "Siri"
let city = "St-Upid"
let price = 544353
let discount = 1

// 试试 +
let newPrice = price-price*discount/100
show("Today, " + name + "'s father died. So he decided to go to " + city + " to go buy a tombstone. When he got there, he suddenly realized that every item the the McAca Market of St-Upid had a " + String(discount) + "% discount. In the end, " + name + " only used " + String(newPrice) + "$ to buy his daddy's tombstone.")
// 试试\(name)占位符
show("Today, \(name)'s father died. So he decided to go to \(city) tto go buy a tombstone. When he got there, he suddenly realized that every item the the McAca Market of St-Upid had a \(discount)% discount. In the end, \(name) only used \(newPrice)$ to buy his daddy's tombstone.")
