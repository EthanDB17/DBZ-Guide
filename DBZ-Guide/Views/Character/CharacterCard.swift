//
//  CharacterCard.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/9/24.
//

import SwiftUI
import Kingfisher

struct CharacterCard: View {
    
    let viewModel: CharacterCardViewModel
    
    var character: Character {
        viewModel.character
    }
    
    var body: some View {
        VStack {
            if let imgUrl = URL(string: character.image) {
                KFImage(imgUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 200)
            }
            
            Text(character.name)
            
            Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 8) {
                GridRow {
                    Text("Base Ki: \(character.ki)")
                    Text("Max Ki: \(character.maxKi)")
                }
                GridRow {
                    Text("Race: \(character.race)")
                    Text("Affiliation: \(character.affilitation)")
                }
            }
            .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(Theme.Colors.primaryCardBackground)
        .cornerRadius(16)
        .shadow(radius: 5)
        .padding(8)
    }
}

#Preview {
    CharacterCard(viewModel: CharacterCardViewModel(character: Character(id: 1, name: "Goku", ki: "60,000,000", maxKi: "90 Septillion", race: "Saiyan", description: "The protagonist of the series, known for his great power and friendly personality. Originally sent to Earth as a flying infantryman with the mission of conquering it. However, falling down a ravine gave him a brutal blow that almost killed him. , this altered his memory and nullified all the violent instincts of his species, which made him grow up with a pure and kind heart, but retaining all the powers of his race. However, in the new Dragon Ball continuity it is established that he. He was sent by his parents to Earth with the goal of surviving the destruction of his planet by Freeza at all costs. Later, Kakarot, now known as Son Goku, would become the prince consort of Mount Fry-pan and. leader of the Z Fighters, as well as the greatest defender of Earth and Universe 7, managing to keep them safe from destruction on countless occasions, despite not considering himself a hero or savior.", image: "https://dragonball-api.com/characters/goku_normal.webp", affilitation: "Z Fighter", originPlanet: nil, transformations: nil)))
}
