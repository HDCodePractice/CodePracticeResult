func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    for (index, num) in nums.enumerated() {
        var i = index + 1
        while i != nums.count {
            if num + nums[i] == target {
                return [index, i]
            }
            i += 1
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
