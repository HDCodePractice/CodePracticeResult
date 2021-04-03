var s = ""
func mf(n : Int) {
    for i in 1 ... n {
        for k in 1 ... i {
            s += "\(i)*\(k)=\(i*k)  "
        }  
        if i < n {
            s += "\n"
        }
    }
    show(s)
}
mf(n : 5)
