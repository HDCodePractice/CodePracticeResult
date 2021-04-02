var str = ""
for i in 1 ... 50{
    for i in 1 ... 51-i {
        str += "*"
    }
    str += "\n"
}
show(str)
