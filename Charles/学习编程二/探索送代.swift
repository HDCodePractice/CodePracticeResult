let n = [0, 1, 2, 3, 4]
// 给循环变量命名并传入数组中。
for i in n {
    // 在每列放置一块宝石和一个开关。
    world.place(Gem(), atColumn: i, row: 1)
    world.place(Switch(), atColumn: i, row: 1)
    
}
