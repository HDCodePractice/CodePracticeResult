func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    for i in 0 ... nums.count - 1 {
        if let index = nums.firstIndex(of: (target - nums[i]) ){
            if i != index {
                return [i,index]
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
