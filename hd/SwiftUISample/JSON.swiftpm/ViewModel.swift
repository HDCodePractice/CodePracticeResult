import SwiftUI

class ViewModel: ObservableObject{
    @Published var histories : [History]  = []
    
    init(){
        guard let path = Bundle.main.path(forResource: "history", ofType: "json") else { return }
        let data = NSData.init(contentsOfFile: path)! as Data
        
        do{
            let hs : [History] = try JSONDecoder().decode([History].self, from: data)
            histories = hs
        } catch {
            print("can't decode file")
        }
    }
    
    func addHistory(){
        guard let path = Bundle.main.path(forResource: "history", ofType: "json") else { return }
        let url = URL(fileURLWithPath: path)
        
        let history = History()
        history.date = "2021/20"
        history.name = "Montreal"
        
        let member = History.Member()
        member.name = "Park"
        member.age = 20
        
        histories.append(history)
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        do {
            let encodeData = try encoder.encode(histories)
            print("encode")
            try! encodeData.write(to: url)
        } catch{
            print("can't write file")
        }
        
    }
}
