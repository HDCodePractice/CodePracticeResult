import SwiftUI

struct PlanetView: View {
    var planetName : String
    var body: some View {
        Image(planetName)
            .resizable()
            .scaledToFit()
            .border(.red, width: 5)
        let planets = ["JupiterView", "MarsView", "MercuryView", "MoonView", "NeptuneView", "PlutoView", "SaturnView", "SunView", "UranusView", "VenusView"]
        let fact1 = ["Jupiter is the largest planet in our solar system, with a diameter of about 86,881 miles (139,822 kilometers). That's more than 11 times the diameter of Earth!", "Mercury is the smallest planet in our solar system. It has a diameter of only about 3,031 miles (4,880 kilometers), which is about one-third the size of Earth. Despite its small size, Mercury is the second densest planet after Earth, which means that it has a relatively large core compared to its size.", "Mercury is the smallest planet in our solar system. It has a diameter of only 4,879 kilometers, which is about 38% the size of Earth's diameter.", "The Moon is the fifth largest natural satellite in our solar system, and it is the largest relative to the size of its host planet. In fact, the Moon is about one quarter the size of Earth, while some of the other planets' moons are less than 1/100th the size of their host planet.", "Neptune is the eighth planet from the Sun and is the farthest planet from our star in our solar system.", "Pluto was discovered in 1930 by American astronomer Clyde Tombaugh. At the time, it was considered the ninth planet in our solar system, but it was later reclassified as a 'dwarf planet' in 2006 due to its small size and irregular orbit.", "Saturn is the sixth planet from the Sun and the second-largest planet in our solar system, with a diameter of about 116,000 kilometers (72,000 miles). It is best known for its beautiful and distinctive rings, which are made up of countless tiny ice particles and rocks.", "The sun is so big that if it were hollow, over a million Earths could fit inside it! The sun's diameter is about 1.39 million kilometers, which is about 109 times the diameter of Earth.", "Uranus is the only planet in our solar system that is named after a Greek god rather than a Roman god. The planet is named after the ancient Greek deity of the sky, Ouranos.", "Venus is the hottest planet in our solar system, with a surface temperature that can reach up to 864 degrees Fahrenheit (462 degrees Celsius). This extreme heat is due to a thick atmosphere made up mostly of carbon dioxide, which traps heat from the sun and creates a runaway greenhouse effect."]
        let fact2 = ["Jupiter has the shortest day of any planet in our solar system, with a rotation period of just 9 hours and 56 minutes. This rapid rotation causes the planet to bulge at the equator and flatten at the poles, giving it a distinct 'squished' appearance.", "Mercury has a very long day and a very short year. It takes just 88 Earth days for Mercury to orbit the sun, but because it rotates very slowly on its axis, it takes 59 Earth days for one day to pass on Mercury. This means that one day on Mercury (the time it takes for the planet to complete one rotation) is almost two Mercury years (the time it takes for the planet to orbit the sun once).", "The Moon has no atmosphere, which means that there is no weather or wind on its surface. As a result, footprints and other marks made by astronauts who visited the Moon during the Apollo missions in the 1960s and 1970s are still visible today, as there is no wind or rain to erase them.", "Neptune's blue color is caused by the presence of methane gas in its atmosphere, which absorbs red light and reflects blue light, giving the planet its distinctive color.", "Pluto has five known moons: Charon, Nix, Hydra, Kerberos, and Styx. Charon is the largest and closest of these moons, and it is so big relative to Pluto that the two objects actually orbit around a point between them, rather than Pluto being the center of Charon's orbit.", "Saturn has the second-shortest day of any planet in our solar system, after Jupiter. A day on Saturn lasts just 10.7 hours, which is less than half the length of a day on Earth. This is due to the planet's rapid rotation, which causes it to spin around its axis much more quickly than most other planets."]
        
        if planetName == "JupiterView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Jupiter()
            }
            
        } else if planetName == "MarsView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Mars()
            }
        } else if planetName == "MercuryView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Mercury()
            }
        } else if planetName == "MoonView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Moon()
            }
        } else if planetName == "NeptuneView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Neptune()
            }
        } else if planetName == "PlutoView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Plato()
            }
        } else if planetName == "SaturnView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Saturn()
            }
        } else if planetName == "UranusView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Uranus()
            }
        } else if planetName == "VenusView"{
            ZStack{
                Image(planetName)
                    .resizable()
                    .scaledToFit()
                    .border(.red, width: 5)
                Venus()
            }
        }
        
    }
}

struct PlanetView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetView(planetName: "EarthView")
    }
}
