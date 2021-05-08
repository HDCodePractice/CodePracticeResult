let r1d1 = Expert()
world.place(r1d1, facing: east, atColumn: 0, row: 4)
if r1d1.isOnGem {
    r1d1.collectGem()
}
r1d1.moveForward()
if r1d1.isOnGem {
    r1d1.collectGem()
}
let r2d2 = Expert()
world.place(r2d2, facing: north, atColumn: 2, row: 4)
if r2d2.isOnGem {
    r2d2.collectGem()
}
let r3d3 = Expert()
world.place(r3d3, facing: east, atColumn: 4, row: 4)
for i in 1 ... 3 {
    if r3d3.isOnGem {
        r3d3.collectGem()
    }
    r3d3.moveForward()
}
let r4d4 = Expert()
world.place(r4d4, facing: north, atColumn: 0, row: 0)
r4d4.collectGem()
let r5d5 = Expert()
world.place(r5d5, facing: north, atColumn: 3, row: 4)
if r5d5.isOnGem {
    r5d5.collectGem()
}
