var str = ""
for i in 1 ... 50{
    for i in 1 ... 50+1-i {
        str += "*"
    }
    str += "\n"
}
show(str)
