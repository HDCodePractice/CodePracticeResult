// GB Value
let GB = 1000
// Total iPhone Storage
let tst = GB*128
// Used Storage
let st = GB*39
// Remaining Storage
let rst = tst-st
// Video space for one minute
let vl = 150
// Remaining Video Space
let cst = rst/vl 

let tst2 = tst/1000
let st2 = st/1000
let rst2 = rst/1000

show("你的手机有" + String(tst2) + "GB存储，\n现在已经使用了" + String(st2) + "GB，\n还有" + String(rst2) + "GB剩余空间，\n你可以再记录" + String(cst) + "分钟视频")


