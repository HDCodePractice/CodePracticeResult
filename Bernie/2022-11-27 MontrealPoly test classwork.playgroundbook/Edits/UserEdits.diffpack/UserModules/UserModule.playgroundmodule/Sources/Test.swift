public func test(){
    var vm = ViewModel()
    for i in 1..<10{
        print("0,\(i) \(vm.gridName(0, i)) \(vm.fillColor(0, i))")
        print("\(i),0 \(vm.gridName(i, 0)) \(vm.fillColor(i, 0))")
        print("\(i),10 \(vm.gridName(i, 0)) \(vm.fillColor(i, 10))")
        print("10,\(i) \(vm.gridName(10, i)) \(vm.fillColor(10, i))")
    }
}
