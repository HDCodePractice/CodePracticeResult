let totalGems = randomNumberOfGems

var gems = 0

for i in 0...6 {
    for j in 2...4 {
        world.place(Character(name: .byte), atColumn: j, row: i)
    }
}
let frontRow = world.coordinates(inColumns: [2])
let blus = world.existingCharacters(at: frontRow)
let midRow = world.coordinates(inColumns: [3])
let blds = world.existingCharacters(at: midRow)
let backRow = world.coordinates(inColumns: [4])
let bldf = world.existingCharacters(at: backRow)

while gems < totalGems {
    for byte in blus {
        if byte.isOnGem {
            byte.collectGem()
            gems += 1
        }
    }
    for byte in blds {
        if byte.isOnGem {
            byte.collectGem()
            gems += 1
        }
    }
    for byte in bldf {
        if byte.isOnGem {
            byte.collectGem()
            gems += 1
        }
    }
}
