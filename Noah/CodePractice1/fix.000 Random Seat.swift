let numbers = [1,2,3,4]
let nombresct = numbers.count - 1

for i in 0 ... nombresct {
    for LOL in 0 ... nombresct {
        for BRUH in 0 ... nombresct {
            if i != LOL && LOL != BRUH && BRUH != i {
                show(numbers[i]*100+numbers[LOL]*10+numbers[BRUH])
            }
        }
    }
}

