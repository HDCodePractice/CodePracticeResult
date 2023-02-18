/// Sets up a choose your own adventure text-based game.
public class Adventure {
    
    /// Determines whether the game can continue playing or if it has ended.
    var gamePlaying = true
    
    /// These are the possible scenarios resulting from the choices you make.
    var scenarios: [ String : String ] = [
        "A" : "You enter a local baking competition at the county fair 🎪. It’s a beautiful summer day and you are excited! When you enter the room, you look around to see ten identical stations.\n\nEach station is stocked with bowls of different sizes, spatulas, spoons, and a standing mixer. You are the third to arrive, so there are many stations still available. Where do you sit?",
        "B" : "Luckily, some nice people fill in around you and wave politely. The directions sounds fun! Make a sponge cake you would have wanted as a child for your birthday, focusing on the decorations and theme. The top three bakers will win a cash prize. You start with a theme.",
        "C" : "Oh no. There is a very loud person next to you. You can barely hear the directions in the back of the room. You think they said something about a birthday cake. Luckily, the person in front of you whispers a brief review of what they said... glazing over a few things. “A birthday cake I would have wanted as a kid.” Hum? You think back to your favorite cake.",
        "D" : "Great choice! Now you just need to make the sponge cake and start thinking about the toppings. You scan the selection on the table and start planning your toppings. In addition to all the colorful icing, you choose...",
        "E" : "Okay, you seem to be in the clear. Everyone else is busy working on their cakes and you are too... only their cakes all look the same. You shrug it off thinking your cake is going to be unique and special. The judges come over and ask you what’s going to go on top of your cake. You tell them:",
        "F" : "The judges come around to ask you about your cake. You are so excited to tell them about your toppings, which include:",
        "G" : "The judges come around to ask you what you are planning. You tell them all about your rainbow-themed cake. One of the things you tell them is:",
        "H" : "There is so much available to decorate with; your cake keeps getting better and better. You notice some of your neighbors are using some decorations you didn’t see on the table. What do you do?",
        "I" : "You are running out of time, so you put your cake in the freezer to speed things up. You check it after ten minutes. What do you do?",
        "J" : "You are feeling good about your timing and start creating your design. You want your theme to come to life, so you decide to upgrade your flat design to become 3D. You head over to the table of supplies and grab:",
        "GOG2" : "When you head to the decorations table to get some candy, you find red, orange, yellow, green, and purple candies, but no blue or indigo! Someone making a troll cake has used all the blue-colored candies. You come in a respectable 4th place, despite your five color rainbow.",
        "GOG3" : "The judges say you overbaked your cake and your marshmallow clouds fall flat. You come in 7th place.",
        "GOF1" : "Now that the judges have moved on, you are able to get going on your decorations. You start by making all the marzipan figurines. Things are looking pretty good until...you SNEEZE! 🤧🦠 The spray goes everywhere and you have to restart your decorations. In the end, you run out of time and come in 8th place.",
        "GOE1" : "The judges come by to ask about your cake. They keep prying for more, and can't understand why you are only using piped icing. After a short time, you realize you have missed a HUGE part of the directions. You complete the challenge and go home in last place.",
        "GOF2" : "Your cake is coming together nicely when a dog bursts into the tent! He runs through, toppling over a tray of your piped decorations. You run out of time to remake them and come in 9th place.",
        "WG1" : "Your rainbow turns out magnificent! The arch is sky high and it impresses the judges. You win 2nd place.🥈",
        "GOH1" : "Right before you get to your neighbors bench, you trip on a power cord and knock over their sponge cake! There is no time for them to start over. They are devastated and you decide to disqualify yourself out of solidarity.",
        "WI1" : "Good thinking! You can complete most of your decorations while your cake continues to cool. You work hard and, before you know it, the competition is over and your cake looks spectacular. You come in 3rd place!🥉",
        "GOI2" : "Oh no, you should have waited! All your frosting melts off the sides and your decorations are a disaster. Luckily your cake perfectly baked. The judges are pretty harsh about your decorations and you finish in 6th place.",
        "WJ1" : "The judges love your theme and the 3D elements really make it come alive! They compliment you on your mix of chocolate and marzipan. You win 1st place! 🎉🎂🥇",
        "GOJ2" : "The judges compliment your theme, but the icing is too thick and overpowers the delicate cake. You come in 5th place.",
    ]
    
    /// These are all the choices you have based upon the scenario you’re in.
    var choices: [ String: String ] = [
        "A1" : "Front row!",
        "A2" : "Find somewhere in the middle",
        "A3" : "Back of the room",
        "B1" : "Trains",
        "B2" : "Castles",
        "B3" : "Rainbows",
        "B4" : "Woodland creatures",
        "B5" : "Outer space",
        "C1" : "Chocolate",
        "C2" : "Red velvet",
        "C3" : "Vanilla confetti",
        "C4" : "Strawberry shortcake",
        "D1" : "Sprinkles",
        "D2" : "Berries",
        "D3" : "Chocolate",
        "E1" : "Piped buttercream frosting",
        "E2" : "Fondant icing",
        "F1" : "Marzipan figurines",
        "F2" : "Fondant figurines",
        "G1" : "It’s in the shape of a rainbow.",
        "G2" : "It has multicolored candies on the outside.",
        "G3" : "It has marshmallow clouds.",
        "H1" : "Pop over to your neighbor’s bench and ask where they got their toppings.",
        "H2" : "Keep working away, your cake will be great even without the specialty item.",
        "I1" : "Pipe the decorations onto parchment paper. You can transfer them at the last minute.",
        "I2" : "Start decorating, you don’t have a minute to waste.",
        "J1" : "Marzipan, and lots of it!",
        "J2" : "Several bags of different color icing."
    ]
    
    /// These are the possible choices for each scenario.
    var scenarioOptions: [String : [String] ] = [
        "A" : ["A1", "A2", "A3"],
        "B" : ["B1", "B2", "B3", "B4", "B5"],
        "C" : ["C1", "C2", "C3", "C4"],
        "D" : ["D1", "D2", "D3"],
        "E" : ["E1", "E2"],
        "F" : ["F1", "F2"],
        "G" : ["G1", "G2", "G3"],
        "H" : ["H1", "H2"],
        "I" : ["I1", "I2"],
        "J" : ["J1", "J2"]
    ]
    
    /// This is the path of the Choose Your Own Adventure story.  Based upon your choice in a given scenario, you will move to a new scenario.
    var path: [ String : String ] = [
        "A1" : "B",
        "A2" : "B",
        "A3" : "C",
        
        "B1" : "D",
        "B2" : "F",
        "B3" : "G",
        "B4" : "F",
        "B5" : "D",
        
        "C1" : "E",
        "C2" : "E",
        "C3" : "F",
        "C4" : "D",
        
        "D1" : "I",
        "D2" : "H",
        "D3" : "J",
        
        "E1" : "GOE1",
        "E2" : "H",
        
        "F1" : "GOF1",
        "F2" : "GOF2",
        
        "G1" : "WG1",
        "G2" : "GOG2",
        "G3" : "GOG3",
        
        "H1" : "GOH1",
        "H2" : "GOJ2",
        
        "I1" : "WI1",
        "I2" : "GOI2",
        
        "J1" : "WJ1",
        "J2" : "GOJ2"
    ]
    
    
    /// Starts the game.
    public func start() {
        
        // Welcomes you to the Choose Your Own Adventure Game.
        show("Welcome to Choose Your Own Adventure")
        show("🥖🍪Bake Off!🥐🍰")
        show("🎂".image())
        pauseUntilTapped(message: "Ready to begin?")
        
        
        var currentScenario = "A"
        
        // The game loop continues to cycle through the path until you reach an end state of either a win or a game over.
        while gamePlaying {
            show(scenarios[currentScenario] ?? "")
            var scenarioChoiceStrings: [String] = []
            if let options = scenarioOptions[currentScenario] {
                for option in options {
                    scenarioChoiceStrings.append(choices[option] ?? "")
                }
            }
            
            let response = askForChoice(nil, strings: scenarioChoiceStrings)
            
            if let key = choices.first(where: { $0.value == response })?.key {
                currentScenario = path[key] ?? ""
            }
            
            if currentScenario.contains("W") {
                gamePlaying = false
                show(scenarios[currentScenario] ?? "")
                show("🍰".image())
                show("🎉💵You are a cash prize winner!💵🥳")
                
            } else if currentScenario.contains("GO") {
                gamePlaying = false
                show(scenarios[currentScenario] ?? "")
                show("😢".image())
                pauseUntilTapped(message: "Try again.")
                gamePlaying = true
                start()
            }
        }
    }
    
    public init() { }
}

 
