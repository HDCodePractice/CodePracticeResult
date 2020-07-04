func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var a : [Int] = []
    for i in 0...nums.count-1 {
        for j in 0...nums.count-1 {
            if nums[i] + nums[j] == target {
                if i != j {
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
