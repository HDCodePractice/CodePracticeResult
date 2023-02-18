/// Creates a quiz that determines which type of thing you are. For example, what type of animal are you?
public class Quiz {
    
    /// The user’s responses to the quiz questions.
    var responses: [String] = []
    
    /// The possible category outcomes and the associated text for each.
    var outcomes: [String: String] = [
    "a Unicorn" : "You are bright, quirky, eccentric, and strong. You are divine and unique, and have an intuitive sense of the world.",
    "a Whale" : "You are larger than life, a mystical creature with unseen depths beneath your surface.",
    "a Leopard" : "You are sleek, intelligent, and dangerous. You have a confidence that radiates from your very form.",
    "a Komodo Dragon" : "Your soul is ancient, filled with the darkness of millenia. Your observant, patient nature, and knowledge of when to strike makes you adept at getting what you want.",
    "a Sea Lion" : "Playful, jubilant, and smart, you enjoy the whimsical parts of life. Hanging with friends, befriending new ones, and taking time to soak up the sun are some of your favorite pastimes.",
    "a Meerkat" : "Keenly aware and meticulously observant, you see things far before they ever happen. Your sixth sense extends to everything you do and manifests itself as a powerful intuition.",
    "a Flamingo" : "Elegant, calm, and social, you enjoy basking in the water and sun, and taking flight whenever you please.",
    "a Wolf" : "Fierce and determined, you fix your mind on an objective and execute. With the soul of a Wolf, your fire burns bright and can light the way for others around you.",
    "a Hummingbird" : "Speedy, sensitive, and excitable, you zip through your days with radiant confidence. You have an unstoppable well of energy that amazes those around you.",
    "an Impala" : "Practical but cautious, you evaluate each situation thoughtfully before you jump in. Able to change directions quickly, you are adaptable to change.",
    "an Elephant" : "With a deep and encyclopedic memory, you guide those around you with the lessons of the past. Your wisdom makes you the perfect person to come to in a time of crisis.",
    "a Dolphin" : "Explorative and adventurous, you’re always seeking out the next big thing. Your personality is fun and magnetic, which makes you a great leader.",
    "a Stoat" : "Cute but deadly, people may underestimate your ability to accomplish the things you want. Your charm and good looks take you to the highest peaks you wish to conquer.",
    "a Quokka" : "Insanely adorable, you are the center of every party. People like being around you, and you like being around them. You can’t help it, you’re a star!"
    ]
    
    /// All of the questions for the quiz, in order.
    var questions: [String] = [
    "One of your kind is being attacked by a predator, and it’s life or death! How do you respond?",
    "What’s your favorite food to eat?",
    "Which activity are you best at?",
    "You are least likely to be friends with people who...",
    "What is your favorite subject?",
    "What type of pet are you most likely to have?",
    "Which adaptation most suits you?",
    "When relaxing, people are most likely to find you...",
    "I also take into account which animal you most closely feel connected to. Which of the following do you see as your animal companion?"
    ]
    
    /// Contains the choices for the questions and resulting scores. Each score array represents the choice’s resulting scores, and some answers might result in scores for mulitple categories, such as ["a Dolphin", "a Whale"].
    public var answerChoices: [Int: [String : [String]]] = [
        0 : [
            "Run!" : ["a Meerkat", "a Flamingo", "a Hummingbird", "an Impala"],
            "Attack the predator, even if you injure it." : ["a Leopard", "a Wolf", "a Dolphin", "an Elephant"],
            "Create a diversion." : ["a Meerkat", "a Sea Lion"],
            "You freeze. You don’t know what to do." : ["a Flamingo", "a Whale", "a Quokka"],
            "Confuse the predator with weird sounds and dancing." : ["a Unicorn", "a Stoat"],
            "Don’t respond. It’s the circle of life." : ["a Komodo Dragon"]
        ],
        1 : [
            "Steak 🥩" : ["a Leopard","a Komodo Dragon", "a Wolf"],
            "Salmon 🐟" : ["a Sea Lion", "a Dolphin"],
            "Salad 🥗" : ["a Quokka", "an Elephant", "an Impala"],
            "Candy 🍬" : ["a Quokka", "a Flamingo", "a Hummingbird"],
            "Avocado 🥑" : ["a Sea Lion", "a Quokka"],
            "Whatever’s in front of me 🍽" : ["a Whale"],
            "Something weird 🤔" : ["a Unicorn", "a Meerkat"],
            "Something I have to catch 🏹" : ["a Stoat", "a Leopard", "a Wolf", "a Dolphin"]
        ],
        2: [
            "Running" : ["an Impala", "a Stoat"],
            "Keeping watch" : ["a Meerkat", "a Komodo Dragon"],
            "Playing Tag" : ["a Wolf", "a Leopard", "a Sea Lion", "a Dolphin", "a Stoat"],
            "Lounging" : ["a Quokka", "a Unicorn", "a Komodo Dragon"],
            "Singing" : ["a Whale", "a Dolphin", "a Flamingo"],
            "Finding something fun to do" : ["a Hummingbird", "a Dolphin", "a Stoat", "a Whale"]
        ],
        3: [
            "Are unmotivated." : ["a Wolf", "a Leopard"],
            "Don’t read books." : ["a Whale", "a Dolphin", "an Elephant"],
            "Avoid risks at all costs." : ["a Sea Lion", "a Stoat", "a Dolphin"],
            "Are rude to people." : ["a Quokka", "an Impala", "a Sea Lion", "a Meerkat", "a Flamingo"],
            "Cower when confronted." : ["a Unicorn", "a Dolphin", "a Stoat", "a Komodo Dragon"]
        ],
        4: [
            "History" : ["a Komodo Dragon"],
            "Physical Education" : ["a Leopard", "a Sea Lion"],
            "Biology" : ["a Dolphin", "an Elephant"],
            "Environmental Science" : ["a Unicorn", "a Sea Lion", "an Impala"],
            "Engineering" : ["a Stoat", "a Meerkat"],
            "Lunch" : ["a Wolf"],
            "Theatre" : ["a Quokka", "a Flamingo", "a Unicorn", "a Hummingbird"]
        ],
        5: [
            "Cat 🐱" : ["a Quokka"],
            "Dog 🐶" : ["a Sea Lion", "a Dolphin"],
            "Sugar Glider" : ["an Impala", "a Stoat"],
            "Hedgehog 🦔" : ["a Quokka", "a Meerkat"],
            "Beta Fish 🐠" : ["a Unicorn", "a Dolphin"],
            "Rat 🐀" : ["a Komodo Dragon"],
            "Fox 🦊" : ["a Stoat", "a Leopard"],
            "I can’t take care of a pet 🙅." : ["a Whale"],
            "Plant 🌵" : ["an Elephant", "a Hummingbird"],
            "Alpaca 🦙" : ["a Flamingo", "a Unicorn"]
        ],
        6: [
            "Claws" : ["a Leopard"],
            "Flight" : ["a Hummingbird", "a Flamingo"],
            "Underwater survival" : ["a Whale", "a Dolphin", "a Sea Lion"],
            "A horn" : ["a Unicorn"],
            "Super smell" : ["a Wolf", "an Elephant"],
            "Super hearing" : ["an Impala", "a Meerkat"],
            "Poisonous venom" : ["a Komodo Dragon"],
            "Hypnosis" : ["a Stoat"],
            "Happiness" : ["a Quokka"]
        ],
        7: [
            "At the beach" : ["a Sea Lion", "a Flamingo"],
            "Playing in the water" : ["an Elephant", "a Dolphin"],
            "On a hike" : ["an Elephant", "an Impala"],
            "In a hammock" : ["a Meerkat", "a Leopard", "a Stoat"],
            "On the couch" : ["a Quokka"],
            "In the garden" : ["a Unicorn", "a Flamingo"],
            "Flying through the sky" : ["a Hummingbird"],
            "Wait...what do you mean by relax?" : ["a Wolf"],
            "Sharpening my knives" : ["a Komodo Dragon", "a Wolf"],
            "Listening to my favorite music" : ["a Whale", "a Flamingo", "a Quokka"]
        ],
        8: [
            "Unicorn" : ["a Unicorn"],
            "Whale" : ["a Whale"],
            "Leopard" : ["a Leopard"],
            "Komodo Dragon" : ["a Komodo Dragon"],
            "Sea Lion" : ["a Sea Lion"],
            "Meerkat" : ["a Meerkat"],
            "Flamingo" : ["a Flamingo"],
            "Wolf" : ["a Wolf"],
            "Hummingbird" : ["a Hummingbird"],
            "Impala" : ["an Impala"],
            "Elephant" : ["an Elephant"],
            "Dolphin" : ["a Dolphin"],
            "Stoat" : ["a Stoat"],
            "Quokka" : ["a Quokka"]
        ]
        
    ]

    /// All of the scores that a user receives based upon their answers to the questions. Each score represents one of the categories.
    var scores: [String] = []
    
    /// The total count of scores for each category.
    var counts: [String: Int] = [:]
    
    /// Evaluates the responses from the quiz to total the scores for each category.
    func evaluateResponses() {
        for response in responses {
            let index = (responses.firstIndex(of: response) ?? 0)
            if let score = answerChoices[index]?[response] {
                scores += score
            }
        }
        
        let counts = scores.reduce(into: [:]) { counts, word in counts[word, default: 0] += 1 }
        calculateAnimal(from: counts)
    }
    
    /// Takes the score counts for each category and calculates a total score.
    func calculateAnimal(from data: [String: Int]) {
        let greatestValue = data.max { a, b in a.value < b.value }
        if let animal = greatestValue?.key {
            show("Congratulations! You are " + animal + "!")
            if let outcome = outcomes[animal] {
                show(outcome)
            }
        }
    }
        
    /// Starts the quiz.
    public func start() {
        show("Why, hello there! My name is Aurelia. I specialize in finding the animal that lies hidden deep within you.")
        show("🧚🏽‍♀️".image())
        show("Ah yes! You have a strong spirit, very good! And the mind — sharp as a whip!")
        show("I’ll just need to ask you a few questions and you’ll soon find out which beast basks in your heart.")
        pauseUntilTapped(message: "Ready to Begin?")
        
        for index in 0...(questions.count - 1) {
            show(questions[index])
            if let choices = answerChoices[index] {
                let answer = askForChoice(strings: Array(choices.keys))
                responses.append(answer)
            }
        }

        pauseUntilTapped(message: "Are you ready to find out which animal you are?")
        evaluateResponses()
    }
    
    public init() {
        
    }
}
