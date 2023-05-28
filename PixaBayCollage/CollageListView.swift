//
//  ContentView.swift
//  PixaBayCollage
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import Combine
import SwiftUI

struct CollageListView: View {
  @ObservedObject var viewModel: CollageListViewModelBase

  init(viewModel: CollageListViewModelBase) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationView {
      VStack(alignment: .leading) {
        List(viewModel.hitsList.hits, id: \.id) { hit in
          AsyncImage(url: URL(string: hit.previewURL)!) { phase in
            switch phase {
            case .empty:
              ProgressView()
            case .success(let image):
              image.resizable()
                .aspectRatio(contentMode: .fit)
            case .failure:
              Text("Failed to load image")
            @unknown default:
              Text("Unknown state")
            }
          }
          Text(hit.tags)
        }
        .onAppear(perform: viewModel.fetchHitsList)
      }
      .navigationTitle("Collage List")
    }
  }
}

struct CollageListView_Previews: PreviewProvider {

  static var previews: some View {
    CollageListView(viewModel: MockCollageListViewModel( networkManager: MockNetworkManager(), usecase: MockCollageListViewModel.UseCase.success))
  }
}
