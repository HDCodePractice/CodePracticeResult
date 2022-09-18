/// /*#-localizable-zone(quiz1)*/Creates a quiz that determines which type of thing you are. For example, what type of animal are you?/*#-end-localizable-zone*/
public class Quiz {
    
    /// /*#-localizable-zone(quiz2)*/The user’s responses to the quiz questions./*#-end-localizable-zone*/
    var responses: [String] = []
    
    /// /*#-localizable-zone(quiz3)*/The possible category outcomes and the associated text for each./*#-end-localizable-zone*/
    var outcomes: [String: String] = [
    "/*#-localizable-zone(quizText1)*/a Unicorn/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText2)*/You are bright, quirky, eccentric, and strong. You are divine and unique, and have an intuitive sense of the world./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText3)*/a Whale/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText4)*/You are larger than life, a mystical creature with unseen depths beneath your surface./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText5)*/a Leopard/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText6)*/You are sleek, intelligent, and dangerous. You have a confidence that radiates from your very form./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText7)*/a Komodo Dragon/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText8)*/Your soul is ancient, filled with the darkness of millenia. Your observant, patient nature, and knowledge of when to strike makes you adept at getting what you want./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText9)*/a Sea Lion/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText10)*/Playful, jubilant, and smart, you enjoy the whimsical parts of life. Hanging with friends, befriending new ones, and taking time to soak up the sun are some of your favorite pastimes./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText11)*/a Meerkat/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText12)*/Keenly aware and meticulously observant, you see things far before they ever happen. Your sixth sense extends to everything you do and manifests itself as a powerful intuition./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText13)*/a Flamingo/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText14)*/Elegant, calm, and social, you enjoy basking in the water and sun, and taking flight whenever you please./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText15)*/a Wolf/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText16)*/Fierce and determined, you fix your mind on an objective and execute. With the soul of a Wolf, your fire burns bright and can light the way for others around you./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText17)*/a Hummingbird/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText18)*/Speedy, sensitive, and excitable, you zip through your days with radiant confidence. You have an unstoppable well of energy that amazes those around you./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText19)*/an Impala/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText20)*/Practical but cautious, you evaluate each situation thoughtfully before you jump in. Able to change directions quickly, you are adaptable to change./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText21)*/an Elephant/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText22)*/With a deep and encyclopedic memory, you guide those around you with the lessons of the past. Your wisdom makes you the perfect person to come to in a time of crisis./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText23)*/a Dolphin/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText24)*/Explorative and adventurous, you’re always seeking out the next big thing. Your personality is fun and magnetic, which makes you a great leader./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText25)*/a Stoat/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText26)*/Cute but deadly, people may underestimate your ability to accomplish the things you want. Your charm and good looks take you to the highest peaks you wish to conquer./*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText27)*/a Quokka/*#-end-localizable-zone*/" : "/*#-localizable-zone(quizText28)*/Insanely adorable, you are the center of every party. People like being around you, and you like being around them. You can’t help it, you’re a star!/*#-end-localizable-zone*/"
    ]
    
    /// /*#-localizable-zone(quiz4)*/All of the questions for the quiz, in order./*#-end-localizable-zone*/
    var questions: [String] = [
    "/*#-localizable-zone(quizText29)*/One of your kind is being attacked by a predator, and it’s life or death! How do you respond?/*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText30)*/What’s your favorite food to eat?/*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText31)*/Which activity are you best at?/*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText32)*/You are least likely to be friends with people who.../*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText33)*/What is your favorite subject?/*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText34)*/What type of pet are you most likely to have?/*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText35)*/Which adaptation most suits you?/*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText36)*/When relaxing, people are most likely to find you.../*#-end-localizable-zone*/",
    "/*#-localizable-zone(quizText37)*/I also take into account which animal you most closely feel connected to. Which of the following do you see as your animal companion?/*#-end-localizable-zone*/"
    ]
    
    /// /*#-localizable-zone(quiz5)*/Contains the choices for the questions and resulting scores. Each score array represents the choice’s resulting scores, and some answers might result in scores for mulitple categories, such as ["a Dolphin", "a Whale"]./*#-end-localizable-zone*/
    public var answerChoices: [Int: [String : [String]]] = [
        0 : [
            "/*#-localizable-zone(quizText38)*/Run!/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText39)*/a Meerkat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText40)*/a Flamingo/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText41)*/a Hummingbird/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText42)*/an Impala/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText43)*/Attack the predator, even if you injure it./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText44)*/a Leopard/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText45)*/a Wolf/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText46)*/a Dolphin/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText47)*/an Elephant/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText48)*/Create a diversion./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText49)*/a Meerkat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText50)*/a Sea Lion/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText51)*/You freeze. You don’t know what to do./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText52)*/a Flamingo/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText53)*/a Whale/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText54)*/a Quokka/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText55)*/Confuse the predator with weird sounds and dancing./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText56)*/a Unicorn/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText57)*/a Stoat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText58)*/Don’t respond. It’s the circle of life./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText59)*/a Komodo Dragon/*#-end-localizable-zone*/"]
        ],
        1 : [
            "/*#-localizable-zone(quizText60)*/Steak 🥩/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText61)*/a Leopard/*#-end-localizable-zone*/","/*#-localizable-zone(quizText62)*/a Komodo Dragon/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText63)*/a Wolf/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText64)*/Salmon 🐟/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText65)*/a Sea Lion/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText66)*/a Dolphin/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText67)*/Salad 🥗/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText68)*/a Quokka/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText69)*/an Elephant/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText70)*/an Impala/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText71)*/Candy 🍬/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText72)*/a Quokka/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText73)*/a Flamingo/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText74)*/a Hummingbird/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText75)*/Avocado 🥑/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText76)*/a Sea Lion/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText77)*/a Quokka/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText78)*/Whatever’s in front of me 🍽/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText79)*/a Whale/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText80)*/Something weird 🤔/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText81)*/a Unicorn/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText82)*/a Meerkat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText83)*/Something I have to catch 🏹/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText84)*/a Stoat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText85)*/a Leopard/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText86)*/a Wolf/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText87)*/a Dolphin/*#-end-localizable-zone*/"]
        ],
        2: [
            "/*#-localizable-zone(quizText88)*/Running/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText89)*/an Impala/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText90)*/a Stoat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText91)*/Keeping watch/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText92)*/a Meerkat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText93)*/a Komodo Dragon/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText94)*/Playing Tag/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText95)*/a Wolf/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText96)*/a Leopard/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText97)*/a Sea Lion/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText98)*/a Dolphin/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText99)*/a Stoat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText100)*/Lounging/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText101)*/a Quokka/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText102)*/a Unicorn/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText103)*/a Komodo Dragon/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText104)*/Singing/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText105)*/a Whale/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText106)*/a Dolphin/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText107)*/a Flamingo/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText108)*/Finding something fun to do/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText109)*/a Hummingbird/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText110)*/a Dolphin/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText111)*/a Stoat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText112)*/a Whale/*#-end-localizable-zone*/"]
        ],
        3: [
            "/*#-localizable-zone(quizText113)*/Are unmotivated./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText114)*/a Wolf/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText115)*/a Leopard/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText116)*/Don’t read books./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText117)*/a Whale/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText118)*/a Dolphin/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText119)*/an Elephant/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText120)*/Avoid risks at all costs./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText121)*/a Sea Lion/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText122)*/a Stoat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText123)*/a Dolphin/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText124)*/Are rude to people./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText125)*/a Quokka/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText126)*/an Impala/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText127)*/a Sea Lion/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText128)*/a Meerkat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText129)*/a Flamingo/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText130)*/Cower when confronted./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText131)*/a Unicorn/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText132)*/a Dolphin/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText133)*/a Stoat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText134)*/a Komodo Dragon/*#-end-localizable-zone*/"]
        ],
        4: [
            "/*#-localizable-zone(quizText135)*/History/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText136)*/a Komodo Dragon/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText137)*/Physical Education/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText138)*/a Leopard/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText139)*/a Sea Lion/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText140)*/Biology/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText141)*/a Dolphin/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText142)*/an Elephant/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText143)*/Environmental Science/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText144)*/a Unicorn/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText145)*/a Sea Lion/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText146)*/an Impala/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText147)*/Engineering/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText148)*/a Stoat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText149)*/a Meerkat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText150)*/Lunch/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText151)*/a Wolf/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText152)*/Theatre/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText153)*/a Quokka/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText154)*/a Flamingo/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText155)*/a Unicorn/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText156)*/a Hummingbird/*#-end-localizable-zone*/"]
        ],
        5: [
            "/*#-localizable-zone(quizText157)*/Cat 🐱/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText158)*/a Quokka/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText159)*/Dog 🐶/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText160)*/a Sea Lion/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText161)*/a Dolphin/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText162)*/Sugar Glider/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText163)*/an Impala/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText164)*/a Stoat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText165)*/Hedgehog 🦔/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText166)*/a Quokka/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText167)*/a Meerkat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText168)*/Beta Fish 🐠/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText169)*/a Unicorn/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText170)*/a Dolphin/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText171)*/Rat 🐀/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText172)*/a Komodo Dragon/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText173)*/Fox 🦊/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText174)*/a Stoat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText175)*/a Leopard/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText176)*/I can’t take care of a pet 🙅./*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText177)*/a Whale/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText178)*/Plant 🌵/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText179)*/an Elephant/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText180)*/a Hummingbird/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText181)*/Alpaca 🦙/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText182)*/a Flamingo/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText183)*/a Unicorn/*#-end-localizable-zone*/"]
        ],
        6: [
            "/*#-localizable-zone(quizText184)*/Claws/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText185)*/a Leopard/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText186)*/Flight/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText187)*/a Hummingbird/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText188)*/a Flamingo/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText189)*/Underwater survival/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText190)*/a Whale/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText191)*/a Dolphin/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText192)*/a Sea Lion/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText193)*/A horn/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText194)*/a Unicorn/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText195)*/Super smell/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText196)*/a Wolf/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText197)*/an Elephant/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText198)*/Super hearing/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText199)*/an Impala/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText200)*/a Meerkat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText201)*/Poisonous venom/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText202)*/a Komodo Dragon/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText203)*/Hypnosis/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText204)*/a Stoat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText205)*/Happiness/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText206)*/a Quokka/*#-end-localizable-zone*/"]
        ],
        7: [
            "/*#-localizable-zone(quizText207)*/At the beach/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText208)*/a Sea Lion/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText209)*/a Flamingo/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText210)*/Playing in the water/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText211)*/an Elephant/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText212)*/a Dolphin/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText213)*/On a hike/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText214)*/an Elephant/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText215)*/an Impala/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText216)*/In a hammock/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText217)*/a Meerkat/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText218)*/a Leopard/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText219)*/a Stoat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText220)*/On the couch/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText221)*/a Quokka/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText222)*/In the garden/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText223)*/a Unicorn/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText224)*/a Flamingo/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText225)*/Flying through the sky/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText226)*/a Hummingbird/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText227)*/Wait...what do you mean by relax?/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText228)*/a Wolf/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText229)*/Sharpening my knives/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText230)*/a Komodo Dragon/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText231)*/a Wolf/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText232)*/Listening to my favorite music/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText233)*/a Whale/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText234)*/a Flamingo/*#-end-localizable-zone*/", "/*#-localizable-zone(quizText235)*/a Quokka/*#-end-localizable-zone*/"]
        ],
        8: [
            "/*#-localizable-zone(quizText236)*/Unicorn/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText237)*/a Unicorn/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText238)*/Whale/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText239)*/a Whale/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText240)*/Leopard/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText241)*/a Leopard/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText242)*/Komodo Dragon/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText243)*/a Komodo Dragon/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText244)*/Sea Lion/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText245)*/a Sea Lion/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText246)*/Meerkat/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText247)*/a Meerkat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText248)*/Flamingo/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText249)*/a Flamingo/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText250)*/Wolf/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText251)*/a Wolf/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText252)*/Hummingbird/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText253)*/a Hummingbird/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText254)*/Impala/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText255)*/an Impala/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText256)*/Elephant/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText257)*/an Elephant/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText258)*/Dolphin/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText259)*/a Dolphin/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText260)*/Stoat/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText261)*/a Stoat/*#-end-localizable-zone*/"],
            "/*#-localizable-zone(quizText262)*/Quokka/*#-end-localizable-zone*/" : ["/*#-localizable-zone(quizText263)*/a Quokka/*#-end-localizable-zone*/"]
        ]
        
    ]

    /// /*#-localizable-zone(quiz6)*/All of the scores that a user receives based upon their answers to the questions. Each score represents one of the categories./*#-end-localizable-zone*/
    var scores: [String] = []
    
    /// /*#-localizable-zone(quiz7)*/The total count of scores for each category./*#-end-localizable-zone*/
    var counts: [String: Int] = [:]
    
    /// /*#-localizable-zone(quiz8)*/Evaluates the responses from the quiz to total the scores for each category./*#-end-localizable-zone*/
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
    
    /// /*#-localizable-zone(quiz9)*/Takes the score counts for each category and calculates a total score./*#-end-localizable-zone*/
    func calculateAnimal(from data: [String: Int]) {
        let greatestValue = data.max { a, b in a.value < b.value }
        if let animal = greatestValue?.key {
            show("/*#-localizable-zone(quizText264)*/Congratulations! You are /*#-end-localizable-zone*/" + animal + "/*#-localizable-zone(quizText264ExclamationMark)*/!/*#-end-localizable-zone*/")
            if let outcome = outcomes[animal] {
                show(outcome)
            }
        }
    }
        
    /// /*#-localizable-zone(quiz10)*/Starts the quiz./*#-end-localizable-zone*/
    public func start() {
        show("/*#-localizable-zone(quizText265)*/Why, hello there! My name is Aurelia. I specialize in finding the animal that lies hidden deep within you./*#-end-localizable-zone*/")
        show("🧚🏽‍♀️".image())
        show("/*#-localizable-zone(quizText266)*/Ah yes! You have a strong spirit, very good! And the mind — sharp as a whip!/*#-end-localizable-zone*/")
        show("/*#-localizable-zone(quizText267)*/I’ll just need to ask you a few questions and you’ll soon find out which beast basks in your heart./*#-end-localizable-zone*/")
        pauseUntilTapped(message: "/*#-localizable-zone(quizText268)*/Ready to Begin?/*#-end-localizable-zone*/")
        
        for index in 0...(questions.count - 1) {
            show(questions[index])
            if let choices = answerChoices[index] {
                let answer = askForChoice(strings: Array(choices.keys))
                responses.append(answer)
            }
        }

        pauseUntilTapped(message: "/*#-localizable-zone(quizText269)*/Are you ready to find out which animal you are?/*#-end-localizable-zone*/")
        evaluateResponses()
    }
    
    public init() {
        
    }
}
