func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var result : [Int] = []
    for i in 0...nums.count-1{
        for j in 0...nums.count-1{
            if j != i{
                if target == nums[i] + nums[j]{
                    result.append(i)
                    result.append(j)
                }
            }
        }
    }
    return result
}

for i in twoSum([1,3,5,7,9], 10) {
    show(i)
}

for i in twoSum([4,1,4], 8) {
    show(i)
}
