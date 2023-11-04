
public func isFlush(cards:[Int])->Bool{
    var styles = [Int]()
    for i in cards{
        styles.append((i-2)/13)
    }
    if Set(styles).count == 1{
        return true
    }
    return false
}
