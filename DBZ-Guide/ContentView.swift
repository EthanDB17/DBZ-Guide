//
//  ContentView.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CharacterCard(viewModel: CharacterCardViewModel(character: Character(id: 1, name: "Goku", ki: "60,000,000", maxKi: "90 Septillion", race: "Saiyan", description: "The protagonist of the series, known for his great power and friendly personality. Originally sent to Earth as a flying infantryman with the mission of conquering it. However, falling down a ravine gave him a brutal blow that almost killed him. , this altered his memory and nullified all the violent instincts of his species, which made him grow up with a pure and kind heart, but retaining all the powers of his race. However, in the new Dragon Ball continuity it is established that he. He was sent by his parents to Earth with the goal of surviving the destruction of his planet by Freeza at all costs. Later, Kakarot, now known as Son Goku, would become the prince consort of Mount Fry-pan and. leader of the Z Fighters, as well as the greatest defender of Earth and Universe 7, managing to keep them safe from destruction on countless occasions, despite not considering himself a hero or savior.", image: "https://dragonball-api.com/characters/goku_normal.webp", affiliation: "Z Fighter", originPlanet: nil, transformations: nil), displayIndex: 0))
    }
}

#Preview {
    ContentView()
}
