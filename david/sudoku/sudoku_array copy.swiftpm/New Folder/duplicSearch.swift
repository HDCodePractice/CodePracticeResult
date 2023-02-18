import SwiftUI

func dupliSearch(arrays:[Int])->(sameElements:[Int],sameIndexes:[[Int]]){
    var indexes :[[Int]] = []
    var sameNum:[Int] = []
    var index = 0
    var arrTmpe = arrays.sorted()
    
    for i in 0..<arrays.count-1{
        if arrTmpe[i] != 0{
            if arrTmpe[i]==arrTmpe[i+1]{
                sameNum.append(arrTmpe[i])
                
            }
        }
    }
    
    let numSets = Set(sameNum).sorted()
    sameNum=[]
    for i in numSets{
        sameNum.append(i)
    }
    
    arrTmpe = arrays
    
    for i in 0..<sameNum.count{
        var indexTemp:[Int]=[]
        for j in 0..<arrays.count{
            
            index = arrTmpe.firstIndex(of: sameNum[i]) ?? 0
            if index == 0{
                if j == 0{
                    indexTemp.append(index)
                    arrTmpe[index] = 0 
                }
            }else{
                indexTemp.append(index)
                arrTmpe[index] = 0 
            }
        }
        indexes.append(indexTemp)
    }
    print(sameNum)
    print(indexes)
    return (sameNum,indexes)
    }
