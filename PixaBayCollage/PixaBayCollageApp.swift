//
//  PixaBayCollageApp.swift
//  PixaBayCollage
//
//  Created by Muhammad Zulqurnain on 28/05/2023.
//

import Foundation
import SwiftUI

@main
struct PixaBayCollageApp: App {
    var body: some Scene {
        WindowGroup {
          CollageListView(viewModel: CollageListViewModel(networkManager: NetworkManager(url: URL(string: "\(Constants.baseUrl)\(Endpoint.nature)")!)))
        }
    }
}
