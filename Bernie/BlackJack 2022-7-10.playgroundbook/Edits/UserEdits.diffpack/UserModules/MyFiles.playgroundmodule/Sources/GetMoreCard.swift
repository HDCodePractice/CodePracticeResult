/**
 问是否要牌
 **/
public func GetMoreCard()->Bool{
    let questions = ["👍".image(),"🖐".image()]
    show("您是否要想要更多一张牌？")
    let answer = askForChoice(images: questions)
    if answer==questions[0]{
        return true
    }
    return false
}
