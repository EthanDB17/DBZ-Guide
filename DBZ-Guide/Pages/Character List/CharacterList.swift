//
//  CharacterList.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/9/24.
//

import SwiftUI

struct CharacterList: View {
    
    @State var viewModel: CharacterListViewModel
    
    var body: some View {
        switch viewModel.state {
        case .loaded, .loadingNextPage: characterGrid()
        default: Text("Not Implemented")
        }
    }
    
    @ViewBuilder private func characterGrid() -> some View {
        let columns = DeviceType.shared.isIpad ?
        [GridItem(.flexible()), GridItem(.flexible())] :
        [GridItem(.flexible())]
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(Array(viewModel.characters.enumerated()), id: \.element.id) { index, character in
                    CharacterCard(viewModel: CharacterCardViewModel(character: character, displayIndex: index))
                        .onAppear {
                            viewModel.checkIfNextPageIsNeeded(displayIndex: index)
                        }
                }
                
                if viewModel.state == .loadingNextPage {
                    ProgressView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    CharacterList(viewModel: CharacterListViewModel())
}
