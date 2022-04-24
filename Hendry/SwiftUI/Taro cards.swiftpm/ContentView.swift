import SwiftUI

struct ContentView: View {
    @State var vm = ViewModel()
    var body: some View {
        switch vm.viewNumber{
        case 1 :
            View1
        case 2 :
            View2
        case 3 :
            View3
        case 4 :
            View4
        case 5:
            View5
        case 6 :
            View6
        case 7 :
            View7
        case 8 :
            View8
        case 9 :
            View9
        case 10 :
            View10
        case 11:
            View11
        case 12:
            View12
        case 13:
            View13
        case 14:
            explantaion
        default:
            firstpage
        }
    }
    
    var firstpage : some View{
        ZStack{
            Color.yellow
            VStack {
                Text("Welcome")
                Button("daily divination"){
                    vm.viewNumber = 1
                    vm.type = 1
                }.buttonStyle(.borderedProminent)
                Spacer()
                Button("love divination"){
                    vm.viewNumber = 2
                    vm.type = 2
                }.buttonStyle(.borderedProminent)
                Spacer()
                Button("Two choose one"){
                    vm.viewNumber = 3
                    vm.type = 3
                }.buttonStyle(.borderedProminent)
                Spacer()
                Button("Explanation of your card and rules"){
                    vm.viewNumber = 14
                }.buttonStyle(.borderedProminent)
            }
        }
    }
    var View1: some View{
        VStack{
            Image("card")
            Button("flip to see your result"){
                vm.rcard()
                vm.viewNumber = 4
            }
            Spacer()
            HStack{
                Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                    vm.viewNumber = 0
                }
                Spacer()
            }
        }
    }
    
    var View2 : some View{
        VStack{
            Image("card")
            Spacer()
            HStack{
                Image("card")
                Image("card")
                Image("card")
            }
            Spacer()
            HStack{
                Spacer()
            Button("flip to see your result"){
                vm.viewNumber = 5
                vm.rcard()
            }
                Spacer()
            }
            HStack{
                Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                    vm.viewNumber = 0
                }
                Spacer()
            }
        }
    }
    var View3 : some View{
        VStack{
            HStack{
                Image("card")
                Spacer()
                Image("card")
            }
            HStack{
                Spacer()
                Image("card")
                Spacer()
                Image("card")
                Spacer()
            }
            HStack{
                Spacer()
                Image("card")
                Spacer()
            }
            HStack{
                Spacer()
                Button("flip to see"){
                    vm.viewNumber = 9
                    vm.rcard()
                }
                Spacer()
            }
            HStack{
                Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                    vm.viewNumber = 0
                }
                Spacer()
            }
        }
        
    }
    var View4 : some View{
        VStack{
            Image(vm.picd).resizable()
                .scaledToFit()
                .padding()
            Text("This is your result, have a great day!")
                Button("back to home"){
                    vm.viewNumber = 0
                }.buttonStyle(.borderedProminent)
        }
    }
    var View5 : some View{
        VStack{
            Image (vm.picl1)
                .resizable()
                .scaledToFit()
                .padding()
            Text("This card represant what you think about him or her.")
            Spacer()
            HStack{
                Button("back to homepage"){
                    vm.viewNumber = 0
                }
                Spacer()
                Image(systemName: "arrow.right.cricle.fill").onTapGesture {
                    vm.viewNumber += 1
                }
            }
        }
    }
    var View6 : some View{
        VStack{
            Image(vm.picl2)
                .resizable()
                .scaledToFit()
                .padding()
            Text("This card represant what him/her think about you.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                    vm.viewNumber -= 1
                }
                Spacer()
                Image(systemName: "arrow.right.cricle.fill").onTapGesture {
                    vm.viewNumber += 1
                }
            }
        }
    }
    var View7 : some View{
        VStack{
            Image(vm.picl3)
                .resizable()
                .scaledToFit()
                .padding()
            Text("This card repreasant your current relationships.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                    vm.viewNumber -= 1
                }
                Spacer()
                Image(systemName: "arrow.right.cricle.fill").onTapGesture {
                    vm.viewNumber += 1
                }
            }
        }
    }
    var View8 : some View{
        VStack{
            Image(vm.picl4)
                .resizable()
                .scaledToFit()
                .padding()
            Text("This card represant your future relationships.")
            Button("back to the main page"){
                vm.viewNumber = 0
            }
            HStack{
            Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                vm.viewNumber -= 1
            }
                Spacer()
            }
        }
    }
    var View9 : some View{
        VStack{
            Image(vm.picc1)
                .resizable()
                .scaledToFit()
                .padding()
            Text("This card represant what the problem looks like.")
            Spacer()
            HStack{
                Spacer()
                Image(systemName: "arrow.right.cricle.fill").onTapGesture {
                    vm.viewNumber += 1
                }
            }
        }
    }
    var View10 : some View{
        VStack{
            Image(vm.picc2)
                .resizable()
                .scaledToFit()
                .padding()
            Text("This card represant what choice one currently looks like.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                    vm.viewNumber -= 1
                }
                Spacer()
                Image(systemName: "arrow.right.cricle.fill").onTapGesture {
                    vm.viewNumber += 1
                }
            }
        }
    }
    var View11 : some View{
        VStack{
            Image(vm.picc3)
                .resizable()
                .scaledToFit()
                .padding()
            Text("This card represant what choice two currently looks like.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                    vm.viewNumber -= 1
                }
                Spacer()
                Image(systemName: "arrow.right.cricle.fill").onTapGesture {
                    vm.viewNumber += 1
                }
            }
        }
    }
    var View12 : some View{
        VStack{
            Image(vm.picc4)
                .resizable()
                .scaledToFit()
                .padding()
            Text("This card represant the result after you pick choice one.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                    vm.viewNumber -= 1
                }
                Spacer()
                Image(systemName: "arrow.right.cricle.fill").onTapGesture {
                    vm.viewNumber += 1
                }
            }
        }
    }
    var View13 : some View {
        VStack{
            Image(vm.picc5)
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
            Text("This card represant the result of choice two.")
            Button("back to home"){
                vm.viewNumber = 0
            }
            HStack{
                Image(systemName: "arrow.left.cricle.fill").onTapGesture {
                    vm.viewNumber -= 1
                }
                Spacer()
            }
        }
    }
    var explantaion : some View{
        VStack{
            if vm.type == 1{
                Image(vm.picd)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }else if vm.type == 2{
                Image(vm.picl1)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Image(vm.picl2)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Image(vm.picl3)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Image(vm.picl4)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }else if vm.type == 3{
                Image(vm.picc1)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Image(vm.picc2)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Image(vm.picc3)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Image(vm.picc4)
                    .resizable()
                    .scaledToFit()
                    .padding()
                Image(vm.picc5)
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("These are the explanation of the card you receved, scroll down to find the one you have got.")
            Text(" ")
        }
    }
}

