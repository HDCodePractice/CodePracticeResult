import SwiftUI

struct movements{
   var vm = ViewModel()
    mutating func movePawn(begin:[Int],end:[Int],color:Color)->Bool{
        print([begin,end])
        var verif = false
        if begin[1] == end[1]{
                if color == .white{
                    if begin[0] == 6{
                        print("1")
                        if begin[0]==end[0]+1{
                            print("2")
                            if vm.board[end[0]][end[1]].token.color == .clear{
                                print("3")
                                verif = true
                            }
                        }else if begin[0]==end[0]+2{
                            if vm.board[end[0]+1][end[1]].token.name == "" && vm.board[end[0]][end[1]].token.name == ""{
                                verif = true
                            }
                        }
                    }else{
                      if begin[0]==end[0]+1{
                          if vm.board[end[0]][end[1]].token.name == ""{
                              verif = true
                          }
                      } 
                    }
                }else{
                    if begin[0] == 1{
                        if begin[0]==end[0]-1{
                            if vm.board[end[0]][end[1]].token.color == .clear{
                                verif = true
                            }
                        }else if begin[0]==end[0]-2{
                            if vm.board[end[0]-1][end[1]].token.name == "" && vm.board[end[0]][end[1]].token.name == ""{
                                verif = true
                            }
                        }
                    }else{
                        if begin[0]==end[0]-1{
                            if vm.board[end[0]][end[1]].token.name == ""{
                                verif = true
                            }
                        } 
                    }
                }
        }
        if verif == true{
            vm.board[begin[0]][begin[1]].token.color = .clear
            vm.board[begin[0]][begin[1]].token.name = ""
            vm.board[end[0]][end[1]].token.color = color
            vm.board[end[0]][end[1]].token.name = "Pawn"
            return verif
        }else{
        return false
        }
    }
    mutating func moveRook(begin:[Int],end:[Int])->Bool{
        var verif = true
        if begin[0] == end[0]{
            if begin[1]<end[1]{
                for i in begin[1]+1...end[1]{
                    if vm.board[begin[0]][i].token.color != .clear{
                        verif = false
                    }
                }
            }else if begin[1]>end[1]{
                for i in end[1]...begin[1]-1{
                    if vm.board[begin[0]][i].token.color != .clear{
                        verif = false
                    }
                }
            }
        }else if begin[1] == end[1]{
            if begin[0]<end[0]{
                for i in begin[0]+1...end[0]{
                     print(i)
                    if vm.board[i][begin[1]].token.color != .clear{
                        verif = false
                    }
                }
            }else if begin[0]>end[0]{
                for i in end[0]...begin[0]-1{
                     print(i)
                    if vm.board[i][begin[1]].token.color != .clear{
                        verif = false
                    }
                }
            }
        }else{
        verif = false
        }
        if verif == true{
            vm.board[end[0]][end[1]].token.color = vm.board[begin[0]][begin[1]].token.color
            vm.board[begin[0]][begin[1]].token.color = .clear
            vm.board[begin[0]][begin[1]].token.name = ""
            vm.board[end[0]][end[1]].token.name = "Rook"
            return verif
        }else{
            return false
        }
    }
    mutating func moveBishop(begin:[Int],end:[Int])->Bool{
        var verif = true
        let x = begin[0]-end[0]
        let y = begin[1]-end[1]
        if x < 0 && y < 0 && x==y{
            for i in 1...end[0]-begin[0]{
                if vm.board[begin[0]+i][begin[1]+i].token.color != .clear{
                    verif = false
                }
            }
        }else if x > 0 && y > 0 && x==y{
            for i in 1...begin[0]-end[0]{
                if vm.board[begin[0]-i][begin[1]-i].token.color != .clear{
                    verif = false
                }
            }
        }else if x > 0 && y < 0 && x == y * -1{
                for i in 1...begin[0]-end[0]{
                    if vm.board[begin[0]-i][begin[1]+i].token.color != .clear{
                        verif = false
                    }
                }
        }else if x < 0 && y > 0 && x == y * -1{
            for i in 1...end[0]-begin[0]{
                if vm.board[begin[0]+i][begin[1]-i].token.color != .clear{
                    verif = false
                }
            }
        }else{
            verif = false
        }
        if verif == true{
            vm.board[end[0]][end[1]].token.color = vm.board[begin[0]][begin[1]].token.color
            vm.board[begin[0]][begin[1]].token.color = .clear
            vm.board[begin[0]][begin[1]].token.name = ""
            vm.board[end[0]][end[1]].token.name = "Bishop"
            return verif
        }
        return false
    }
}
