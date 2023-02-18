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
            View3.ignoresSafeArea()
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
                Spacer()
                Text("Welcome, choose the type of divination you want").font(.largeTitle)
                Button("daily divination"){
                    vm.viewNumber = 1
                    vm.cardpull = []
                    vm.whatsc = 1
                    
                }.buttonStyle(.borderedProminent)
                    .font(.title)
                Button("love divination"){
                    vm.viewNumber = 2
                    vm.cardpull = []
                    vm.whatsc = 2
                }.buttonStyle(.borderedProminent)
                    .font(.title)
                Button("Two choose one"){
                    vm.viewNumber = 3
                    vm.cardpull = []
                    vm.whatsc = 3
                }.buttonStyle(.borderedProminent)
                    .font(.title)
                Spacer()
            }
        }.ignoresSafeArea()
    }
    var View1: some View{
        ZStack{
            Color.purple
            VStack{
                Spacer()
                Text("This is your daily divination, have a good luck")
                Image("card")
                Button("flip to see your result"){
                    vm.rcard()
                    vm.viewNumber = 4
                }.buttonStyle(.borderedProminent)
                Spacer()
                HStack{
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.largeTitle)
                        .onTapGesture {
                            vm.viewNumber = 0
                        }
                    Spacer()
                }
            }
        }.ignoresSafeArea()
    }
    
    var View2 : some View{
        ZStack{
            Color.red
            VStack{
                Spacer()
                Text("This is your love divination, have a good luck")
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
                    }.buttonStyle(.borderedProminent)
                    Spacer()
                }
                HStack{
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.largeTitle)
                        .onTapGesture {
                            vm.viewNumber = 0
                        }
                    Spacer()
                }
            }
        }.ignoresSafeArea()
    }
    var View3 : some View{
        ZStack{
            Color.cyan
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
                    }.buttonStyle(.borderedProminent)
                    Spacer()
                }
                HStack{
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.largeTitle)
                        .onTapGesture {
                            vm.viewNumber = 0
                        }
                    Spacer()
                }
            }
        }.ignoresSafeArea()
    }
    var View4 : some View{
        VStack{
            if vm.uorr%2==0{
                Image(vm.picd).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picd).resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("This is your result, have a great day!")
            Button("Check the explanation"){
                vm.viewNumber = 14
            }
            Button("back to home"){
                vm.viewNumber = 0
            }.buttonStyle(.borderedProminent)
        }
    }
    var View5 : some View{
        VStack{
            if vm.uorr1%2==0{
                Image(vm.picl1).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picl1).resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("This card represant what you think about him or her.")
            Spacer()
            HStack{
                Button("back to homepage"){
                    vm.viewNumber = 0
                }
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber += 1
                    }
            }
        }
    }
    var View6 : some View{
        VStack{
            if vm.uorr2%2==0{
                Image(vm.picl2).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picl2).resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("This card represant what him/her think about you.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber -= 1
                    }
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber += 1
                    }
            }
        }
    }
    var View7 : some View{
        VStack{
            if vm.uorr3%2==0{
                Image(vm.picl3).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picl3).resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("This card repreasant your current relationships.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber -= 1
                    }
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber += 1
                    }
            }
        }
    }
    var View8 : some View{
        VStack{
            if vm.uorr4%2==0{
                Image(vm.picl4).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picl4).resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("This card represant your future relationships.")
            Button("back to the main page"){
                vm.viewNumber = 0
            }
            HStack{
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber -= 1
                    }
                Spacer()
                Button("To the explanation"){
                    vm.viewNumber = 14
                }.buttonStyle(.borderedProminent)
            }
        }
    }
    var View9 : some View{
        VStack{
            if vm.uorr5%2==0{
                Image(vm.picc1).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picc1).resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("This card represant what the problem looks like.")
            
            HStack{
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber += 1
                    }
            }
        }
    }
    var View10 : some View{
        VStack{
            if vm.uorr6%2==0{
                Image(vm.picc2).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picc2).resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("This card represant what choice one currently looks like.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber -= 1
                    }
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber += 1
                    }
            }
        }
    }
    var View11 : some View{
        VStack{
            if vm.uorr7%2==0{
                Image(vm.picc3).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picc3).resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("This card represant what choice two currently looks like.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber -= 1
                    }
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber += 1
                    }
            }
        }
    }
    var View12 : some View{
        VStack{
            if vm.uorr8%2==0{
                Image(vm.picc4).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picc4).resizable()
                    .scaledToFit()
                    .padding()
            }
            Text("This card represant the result after you pick choice one.")
            Spacer()
            HStack{
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber -= 1
                    }
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber += 1
                    }
            }
        }
    }
    var View13 : some View {
        VStack{
            if vm.uorr9%2==0{
                Image(vm.picc5).resizable()
                    .scaledToFit()
                    .padding()
                    .rotationEffect(Angle.init(degrees: 180))
            }else{
                Image(vm.picc5).resizable()
                    .scaledToFit()
                    .padding()
            }
            Spacer()
            Text("This card represant the result of choice two.")
            Button("back to home"){
                vm.viewNumber = 0
            }
            HStack{
                Image(systemName: "arrow.left.circle.fill")
                    .font(.largeTitle)
                    .onTapGesture {
                        vm.viewNumber -= 1
                    }
                Spacer()
                Button("To the explanation"){
                    vm.viewNumber = 14
                }.buttonStyle(.borderedProminent)
            }
        }
    }
    var explantaion : some View{
        ScrollView{
            VStack{
                VStack{
                    Text("This is the card you have just pulled")
                        .font(.largeTitle)
                    if vm.whatsc == 1{
                        if vm.uorr%2==0{
                            Image(vm.picd).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picd).resizable()
                                .scaledToFit()
                                .padding()
                        }
                    }else if vm.whatsc == 2{
                        if vm.uorr1%2==0{
                            Image(vm.picl1).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picl1).resizable()
                                .scaledToFit()
                                .padding()
                        }
                        if vm.uorr2%2==0{
                            Image(vm.picl2).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picl2).resizable()
                                .scaledToFit()
                                .padding()
                        }
                        if vm.uorr3%2==0{
                            Image(vm.picl3).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picl3).resizable()
                                .scaledToFit()
                                .padding()
                        }
                        if vm.uorr4%2==0{
                            Image(vm.picl4).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picl4).resizable()
                                .scaledToFit()
                                .padding()
                        }
                        Text("The first card represant what you think of the other")
                        Text("The second card represant what the other think about you")
                        Text("The third card represant your current relationships")
                        Text("The fourth card represant your future relationship")
                    }else {
                        if vm.uorr5%2==0{
                            Image(vm.picc1).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picc1).resizable()
                                .scaledToFit()
                                .padding()
                        }
                        if vm.uorr6%2==0{
                            Image(vm.picc2).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picc2).resizable()
                                .scaledToFit()
                                .padding()
                        }
                        if vm.uorr7%2==0{
                            Image(vm.picc3).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picc3).resizable()
                                .scaledToFit()
                                .padding()
                        }
                        if vm.uorr8%2==0{
                            Image(vm.picc4).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picc4).resizable()
                                .scaledToFit()
                                .padding()
                        }
                        if vm.uorr9%2==0{
                            Image(vm.picc5).resizable()
                                .scaledToFit()
                                .padding()
                                .rotationEffect(Angle.init(degrees: 180))
                        }else{
                            Image(vm.picc5).resizable()
                                .scaledToFit()
                                .padding()
                        }
                        Text("The first card is what the problem currently look like.")
                        Text("The second card is what choice one look like")
                        Text("The third card is what the second choice look like")
                        Text("The fourth card is what happen after you pick choice one")
                        Text("The fifth card is what happen if you pick choice two")
                    }
                    Text("The Major Arcana")
                        .font(.largeTitle)
                    Text("The Fool")
                        .font(.headline)
                    Text("Upright: beginnings, freedom, innocence, originality, adventure, idealism, spontaneity")
                    Text("Reversed: reckless, careless, distracted, naive, foolish, gullible, stale, dull")
                    Text("Tha Magician")
                        .font(.headline)
                    Text("Upright:willpower, desire, being resourceful,, skill, ability, concentration, manifestation")
                    Text("Reversed:manipulation, cunning, trickery, wasted talent, illusion, deception")
                }
                VStack{
                    Text("The High Priestess")
                        .font(.headline)
                    Text("Upright:unconscious, intuition, mystery, spirituality, higher power, inner voice")
                    Text("Reversed:repressed intuition, hidden motives, superficiality, confusion, cognitive dissonance")
                    Text("The Empress")
                        .font(.headline)
                    Text("Upright:divine feminine, sensuality, fertility, nurturing, creativity, beauty, abundance, nature")
                    Text("Reversed:insecurity, overbearing, negligence, smothering, lack of growth, lack of progress")
                    Text("The Emperor")
                        .font(.headline)
                    Text("Upright:stability, structure, protection, authority, control, practicality, focus, discipline")
                    Text("Reversed:tyrant, domineering, rigid, stubborn, lack of discipline, recklessness")
                }
                VStack{
                    Text("The Hierophant")
                        .font(.headline)
                    Text("Upright:tradition, social groups, conventionality, conformity, education, knowledge, beliefs")
                    Text("Reversed:rebellion, unconventionality, non-conformity, new methods, ignorance")
                    Text("The Lovers")
                        .font(.headline)
                    Text("Upright:love, unions, partnerships, relationships, choices, romance, balance, unity")
                    Text("Reversed:disharmony, imbalance, conflict, detachment, bad choices, indecision")
                    Text("The Chariot")
                        .font(.headline)
                    Text("Upright:success, ambition, determination, willpower, control, self-discipline, focus")
                    Text("Reversed:forceful, no direction, no control, powerless, aggression, obstacles")
                }
                VStack{
                    Text("Strength")
                        .font(.headline)
                    Text("Upright:courage, bravery, confidence, compassion, self-confidence, inner power")
                    Text("Reversed:self-doubt, weakness, low confidence, inadequacy, cowardice, forcefulness")
                    Text("The Hermit")
                        .font(.headline)
                    Text("Upright:self-reflection, introspection, contemplation, withdrawal, solitude, search for self")
                    Text("Reversed:loneliness, isolation, recluse, being anti-social, rejection, returning to society")
                    Text("The Wheel of Fortune")
                        .font(.headline)
                    Text("Upright:change, cycles, fate, decisive moments, luck, fortune, unexpected events")
                    Text("Reversed:bad luck, lack of control, clinging to control, unwelcome changes, delays")
                }
                VStack{
                    Text("Justice")
                        .font(.headline)
                    Text("Upright:justice, karma, consequence, accountability, law, truth, honesty, integrity, cause and effect")
                    Text("Reversed:injustice, retribution, dishonesty, corruption, dishonesty, unfairness, avoiding accountability")
                    Text("The Hanged Man")
                        .font(.headline)
                    Text("Upright:sacrifice, waiting, uncertainty, lack of direction, perspective, contemplation")
                    Text("Reversed:stalling, disinterest, stagnation, avoiding sacrifice, standstill, apathy")
                    Text("Death")
                        .font(.headline)
                    Text("Upright:transformation, endings, change, transition, letting go, release")
                    Text("Reversed:fear of change, repeating negative patterns, resisting change, stagnancy, decay")
                }
                VStack{
                    Text("Temperance")
                        .font(.headline)
                    Text("Upright:balance, peace, patience, moderation, calm, tranquillity, harmony, serenity")
                    Text("Reversed:imbalance, excess, extremes, discord, recklessness, hastiness")
                    Text("The Devil")
                        .font(.headline)
                    Text("Upright:oppression, addiction, obsession, dependency, excess, powerlessness, limitations")
                    Text("Reversed:independence, freedom, revelation, release, reclaiming power, reclaiming control")
                    Text("The Tower")
                        .font(.headline)
                    Text("Upright:disaster, destruction, upheaval, trauma, sudden change, chaos")
                    Text("Reversed:averting disaster, delaying the inevitable, resisting change")
                    Text("The Star")
                        .font(.headline)
                }
                VStack{
                    Text("Upright:hope, inspiration, positivity, faith, renewal, healing, rejuvenation")
                    Text("Reersed:hopelessness, despair, negativity, lack of faith, despondent")
                    Text("The Moon")
                        .font(.headline)
                    Text("Upright:illusion, intuition, uncertainty, confusion, complexity, secrets, unconscious")
                    Text("Reversed:fear, deception, anxiety, misunderstanding, misinterpretation, clarity, understanding")
                    Text("The Sun")
                        .font(.headline)
                    Text("Upright:happiness, success, optimism, vitality, joy, confidence, happiness, truth")
                    Text("Reversed:blocked happiness, excessive enthusiasm, pessimism, unrealistic expectations, conceitedness")
                    Text("The world")
                        .font(.headline)
                    Text("Upright:completion, achievement, fulfilment, sense of belonging, wholeness, harmony")
                }
                VStack{
                    Text("Reersed:lack of closure, lack of achievement, feeling incomplete, emptiness")
                    Text("Minor Arcana")
                        .font(.largeTitle)
                    Text("Ace of wands")
                        .font(.headline)
                    Text("Upright:inspiration, creative spark, new initiative, new passion, enthusiasm, energy")
                    Text("Reversed:delays, blocks, lack of passion, lack of energy, hesitancy, creative blocks")
                    Text("Two of wands")
                        .font(.headline)
                    Text("Upright:planning, first steps, making decisions, leaving comfort, taking risks")
                    Text("Reversed:bad planning, overanalyzing, not taking action, playing it safe, avoiding risk")
                    Text("Three of wands")
                        .font(.headline)
                    Text("Upright:momentum, confidence, expansion, growth, foresight, looking ahead")
                    
                }
                VStack{
                    Text("Reversed:restriction, limitations, lack of progress, obstacles, delays, frustration")
                    Text("Four of wands")
                        .font(.headline)
                    Text("Upright:community, home, celebrations, reunions, parties, gatherings, stability, belonging")
                    Text("Reversed:lack of support, instability, feeling unwelcome, transience, lack of roots, home conflict")
                    Text("five of wands")
                        .font(.headline)
                    Text("Upright:conflict, competition, arguments, aggression, tension, rivals, clashes of ego")
                    Text("Reversed:end of conflict, cooperation, agreements, truces, harmony, peace, avoiding conflict")
                    Text("Six of wands")
                        .font(.headline)
                    Text("Upright:success, victory, triumph, rewards, recognition, praise, acclaim, pride")
                    Text("Reversed:failure, lack of recognition, no rewards, lack of achievement")
                }
                VStack{
                    Text("Seven of wands")
                        .font(.headline)
                    Text("Upright:protectiveness, standing up for yourself, defending yourself, protecting territory")
                    Text("Reversed:giving up, admitting defeat, yielding, lack of self belief, surrender")
                    Text("Eight of wands")
                        .font(.headline)
                    Text("Upright:movement, speed, progress, quick decisions, sudden changes, excitement")
                    Text("Reversed:waiting, slowness, chaos, delays, losing momentum, hastiness, being unprepared")
                    Text("Nine of wands")
                        .font(.headline)
                    Text("Upright:last stand, persistence, grit, resilience, perseverance, close to success, fatigue")
                    Text("Reversed:stubbornness, rigidity, defensiveness, refusing compromise, giving up")
                }
            }
            VStack{
                VStack{
                    Text("Ten of wands")
                        .font(.headline)
                    Text("Upright:burden, responsibility, duty, stress, obligation, burning out, struggles")
                    Text("Reversed:failure to delegate, shouldering too much responsibility, collapse, breakdown")
                    Text("Page of wands")
                        .font(.headline)
                    Text("Upright:adventure, excitement, fresh ideas, cheerfulness, energetic, fearless, extroverted")
                    Text("Reversed:hasty, impatient, lacking ideas, tantrums, laziness, boring, unreliable, distracted")
                    Text("Knight of wands")
                        .font(.headline)
                    Text("Upright:courageous, energetic, charming, hero, rebellious, hot tempered, free spirit")
                    Text("Reversed:arrogant, reckless, impatient, lack of self control, passive, volatile, domineering")
                }
                VStack{
                    Text("Queen of wands")
                        .font(.headline)
                    Text("Upright:confident, self-assured, passionate, determined, social, charismatic, vivacious, optimistic")
                    Text("Reversed:demanding, vengeful, low confidence, jealous, selfish, temperamental, bully")
                    Text("King of wands")
                        .font(.headline)
                    Text("Upright:leadership, vision, big picture, taking control, daring decisions, boldness, optimism")
                    Text("Reversed:forceful, domineering, tyrant, vicious, powerless, ineffective, weak leader")
                    Text("Ace of Cups")
                        .font(.headline)
                    Text("Upright:love, new feelings, emotional awakening, creativity, spirituality, intuition")
                    Text("Reversed:coldness, emptiness, emotional loss, blocked creativity, feeling unloved, gloominess")
                }
                VStack{
                    Text("Two of cups")
                        .font(.headline)
                    Text("Upright:unity, partnership, attraction, connection, close bonds, joining forces, mutual respect")
                    Text("Reversed:separation, rejection, division, imbalance, tension, bad communication, withdrawal")
                    Text("Three of cups")
                        .font(.headline)
                    Text("Upright:friendship, community, gatherings, celebrations, group events, social events")
                    Text("Reversed:gossip, scandal, excess, isolation, loneliness, solitude, imbalanced social life")
                    Text("four of cups")
                        .font(.headline)
                    Text("Upright:apathy, contemplation, feeling disconnected, melancholy, boredom, indifference, discontent")
                    Text("Reversed:clarity, awareness, acceptance, choosing happiness, depression, negativity")
                }
                VStack{
                    Text("Five of cups")
                        .font(.headline)
                    Text("Upright:loss, grief, disappointment, sadness, mourning, discontent, feeling let down")
                    Text("Reversed:acceptance, moving on, finding peace, contentment, seeing positives")
                    Text("Six of cups")
                        .font(.headline)
                    Text("Upright:nostalgia, memories, familiarity, healing, comfort, sentimentality, pleasure")
                    Text("Reversed:stuck in past, moving forward, leaving home, independence")
                    Text("Seven of cups")
                        .font(.headline)
                    Text("Upright:choices, searching for purpose, illusion, fantasy, daydreaming, wishful thinking, indecision")
                    Text("Reversed:lack of purpose, disarray, confusion, diversion, distractions, clarity, making choices")
                }
                VStack{
                    Text("Eight of cups")
                        .font(.headline)
                    Text("Upright:abandonment, walking away, letting go, searching for truth, leaving behind")
                    Text("Reversed:stagnation, monotony, accepting less, avoidance, fear of change, staying in bad situation")
                    Text("Nine of cups")
                        .font(.headline)
                    Text("Upright:wishes coming true, contentment, satisfaction, success, achievements, recognition, pleasure")
                    Text("Reversed:unhappiness, lack of fulfilment, disappointment, underachievement, arrogance, snobbery")
                    Text("Ten of cups")
                        .font(.headline)
                    Text("Upright:happiness, homecomings, fulfillment, emotional stability, security, domestic harmony")
                    Text("Reversed:unhappy home, separation, domestic conflict, disharmony, isolation​")
                }
                VStack{
                    Text("Page of cups")
                        .font(.headline)
                    Text("Upright:idealism, sensitivity, dreamer, naivete, innocence, inner child, head in the clouds")
                    Text("Reversed:emotional vulnerability, immaturity, neglecting inner child, escapism, insecurity")
                    Text("Knight of cups")
                        .font(.headline)
                    Text("Upright:idealist, charming, artistic, graceful, tactful, diplomatic, mediator, negotiator")
                    Text("Reversed:disappointment, tantrums, moodiness, turmoil, avoiding conflict, vanity")
                    Text("Queen of cups")
                        .font(.headline)
                    Text("Upright:compassion, warmth, kindness, intuition, healer, counsellor, supportive")
                    Text("Reversed:insecurity, giving too much, overly-sensitive, needy, fragile, dependence, martyrdom")
                }
                VStack{
                    Text("king of cups")
                        .font(.headline)
                    Text("Upright:wise, diplomatic, balance between head and heart, devoted, advisor, counsellor")
                    Text("Reversed:overwhelmed, anxious, cold, repressed, withdrawn, manipulative, selfish")
                    Text("Ace of swords")
                        .font(.headline)
                    Text("Upright:clarity, breakthrough, new idea, concentration, vision, force, focus, truth")
                    Text("Reversed:confusion, miscommunication, hostility, arguments, destruction, brutality")
                    Text("Two of swords")
                        .font(.headline)
                    Text("Upright:stalemate, difficult choices, stuck in the middle, denial, hidden information")
                    Text("Reversed:indecision, hesitancy, anxiety, too much information, no right choice, truth revealed")
                }
                VStack{
                    Text("Three of swords")
                        .font(.headline)
                    Text("Upright:heartbreak, separation, sadness, grief, sorrow, upset, loss, trauma, tears")
                    Text("Reversed:healing, forgiveness, recovery, reconciliation, repressing emotions")
                    Text("Four of swords")
                        .font(.headline)
                    Text("Upright:rest, relaxation, peace, sanctuary, recuperation, self-protection, rejuvenation")
                    Text("Reversed:recovery, awakening, re-entering world, release from isolation, restlessness, burnout")
                    Text("Five of swords")
                        .font(.headline)
                    Text("Upright:arguments, disputes, aggression, bullying, intimidation, conflict, hostility, stress")
                    Text("Reversed:reconciliation, resolution, compromise, revenge, regret, remorse, cutting losses")
                }
                VStack{
                    Text("Six of swords")
                        .font(.headline)
                    Text("Upright:moving on, departure, leaving behind, distance, accepting lessons")
                    Text("Reversed:stuck in past, returning to trouble, running away from problems, trapped")
                    Text("Seven of swords")
                        .font(.headline)
                    Text("Upright:lies, trickery, scheming, strategy, resourcefulness,sneakiness, cunning")
                    Text("Reversed:confession, conscience, regret, maliciousness, truth revealed")
                    Text("Eight of swords")
                        .font(.headline)
                    Text("Upright:trapped, restricted, victimised, paralysed, helpless, powerless, imprisonment")
                    Text("Reversed:freedom, release, taking control, survivor, facing fears, empowered, surrender")
                }
                VStack{
                    Text("Nine of swords")
                        .font(.headline)
                    Text("Upright:fear, anxiety, negativity, breaking point, despair, nightmares, isolation")
                    Text("Reversed:recovery, learning to cope, facing life, finding help, shame, guilt, mental health issues")
                    Text("Ten of swords")
                        .font(.headline)
                    Text("Upright:ruin, failure, bitterness, collapse, exhaustion, dead end, victimization, betrayal")
                    Text("Reversed:survival, improvement, healing, lessons learned, despair, relapse")
                    Text("Page of swords")
                        .font(.headline)
                    Text("Upright:curious, witty, chatty, communicative, inspired, vigilant, alert, mental agility")
                    Text("Reversed:scatterbrained, cynical, sarcastic, gossipy, insulting, rude, lack of planning")
                }
            }
            VStack{
                VStack{
                    Text("Knight of swords")
                        .font(.headline)
                    Text("Upright:assertive, direct, impatient, intellectual, daring, focused, perfectionist, ambitious")
                    Text("Reversed:rude, tactless, forceful, bully, aggressive, vicious, ruthless, arrogant")
                    Text("Queen of swords")
                        .font(.headline)
                    Text("Upright:honest, independent, principled, fair, constructive criticism, objective, perceptive")
                    Text("Reversed:pessimistic, malicious, manipulative, harsh, bitter, spiteful, cruel, deceitful, unforgiving")
                    Text("King of swords")
                        .font(.headline)
                    Text("Upright:reason, authority, discipline, integrity, morality, serious, high standards, strict")
                    Text("Reversed:irrational, dictator, oppressive, inhumane, controlling, cold, ruthless, dishonest")
                }
                VStack{
                    Text("Ace of pentacles")
                        .font(.headline)
                    Text("Upright:new opportunities, resources, abundance, prosperity, security, stability, manifestation")
                    Text("Reversed:missed chances, scarcity, deficiency, instability, stinginess, bad investments")
                    Text("Two of pentacles")
                        .font(.headline)
                    Text("Upright:balancing resources, adaptation, resourcefulness, flexibility, stretching resources")
                    Text("Reversed:imbalance, unorganized, overwhelmed, messiness, chaos, overextending")
                    Text("Three of pentacles")
                        .font(.headline)
                    Text("Upright:teamwork, shared goals, collaboration, apprenticeship, effort, pooling energy")
                    Text("Reversed:lack of cohesion, lack of teamwork, apathy, poor motivation, conflict, ego, competition")
                }
                VStack{
                    Text("Four of pentacles")
                        .font(.headline)
                    Text("Upright:possessiveness, insecurity, hoarding, stinginess, stability, security, savings, materialism, wealth, frugality, boundaries, guardedness")
                    Text("Reversed:generosity, giving, spending, openness, financial insecurity, reckless spending")
                    Text("Five of pentacles")
                        .font(.headline)
                    Text("Upright:hardship, loss, isolation, feeling abandoned, adversity, struggle, unemployment, alienation, disgrace")
                    Text("Reversed:positive changes, recovery from loss, overcoming adversity, forgiveness, feeling welcomed")
                    Text("Six of pentacles")
                        .font(.headline)
                    Text("Upright:generosity, charity, community, material help, support, sharing, giving and receiving, gratitude")
                    Text("Reversed:power dynamics, abuse of generosity, strings attached gifts, inequality, extortion")
                }
                VStack{
                    Text("Seven of pentacles")
                        .font(.headline)
                    Text("Upright:harvest, rewards, results, growth, progress, perseverance, patience, planning")
                    Text("Reversed:unfinished work, procrastination, low effort, waste, lack of growth, setbacks, impatience, lack of reward")
                    Text("Eight of pentacles")
                        .font(.headline)
                    Text("Upright:skill, talent, craftsmanship, quality, high standards, expertise, mastery, commitment, dedication, accomplishment")
                    Text("Reversed:lack of quality, rushed job, bad reputation, lack of motivation, mediocrity, laziness, low skill, dead-end job")
                    Text("Nine of pentacles")
                        .font(.headline)
                    Text("Upright:rewarded efforts, success, achievement, independence, leisure, material security, self-sufficiency")
                    Text("Reversed:being guarded, living beyond means, material instability, reckless spending, superficiality")
                }
                VStack{
                    Text("Ten of pentacles")
                        .font(.headline)
                    Text("Upright:legacy, roots, family, ancestry, inheritance, windfall, foundations, privilege, affluence, stability, tradition")
                    Text("Reversed:family disputes, bankruptcy, debt, fleeting success, conflict over money, instability, breaking traditions")
                    Text("Page of pentacles")
                        .font(.headline)
                    Text("Upright:ambitious, diligent, goal oriented, planner, consistent, star student, studious, grounded, loyal, faithful, dependable")
                    Text("Reversed:foolish, immature, irresponsible, lazy, underachiever, procrastinator, missed chances, poor prospects")
                    Text("Knight of pentacles")
                        .font(.headline)
                    Text("Upright:practical, reliable, efficient, stoic, slow and steady, hard-working, committed, patient, conservative")
                    Text("Reversed:workaholic, laziness, dull, boring, no initiative, cheap, irresponsible, gambler, risky investments")
                }
                VStack{
                    Text("Queen of pentacles")
                        .font(.headline)
                    Text("Upright:generous, caring, nurturing, homebody, good business sense, practical, comforting, welcoming, sensible, luxurious")
                    Text("Reversed:family disputes, bankruptcy, debt, fleeting success, conflict over money, instability, breaking traditions")
                    Text("King of pentacles")
                        .font(.headline)
                    Text("Upright:abundance, prosperity, security, ambitious, safe, kind, patriarchal, protective, businessman, provider, sensual, reliable")
                    Text("Reversed:greed, materialistic, wasteful, chauvanist, poor financial decisions, gambler, exploitative, possessive")
                    
                }
                Button("Back to home"){
                    vm.viewNumber = 0
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

