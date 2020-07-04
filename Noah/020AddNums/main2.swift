func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var a : [Int] = []
    for j in 0 ... nums.count - 1 {
        for k in 0 ... nums.count - 1{
            if nums[j] + nums[k] == target && j != k && k > j {
                a.append(j)
                a.append(k)
            }
        }
    }
    return a
}

for i in twoSum([1,3,5,7,9], 10) {
    show(i)
}

for i in twoSum([3,3], 6) {
    show(i)
}
