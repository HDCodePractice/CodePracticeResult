func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0 ... nums.count - 1 {
        for j in 0 ... nums.count - 1 {
            if i != j {
                if target == nums[i] + nums[j] {
                    return [i,j]
                }
            }
        }
    }
    return []
}

for i in twoSum([1,3,5,7,9], 10) {
    show(i)
}

for i in twoSum([3,3], 6) {
    show(i)
}
