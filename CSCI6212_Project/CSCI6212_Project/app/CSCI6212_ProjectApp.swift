//
//  CSCI6212_ProjectApp.swift
//  CSCI6212_Project
//
//  Created by zuxuan chen on 9/6/23.
//

import SwiftUI

@main
struct CSCI6212_ProjectApp: App {
    @StateObject var locationViewModel=LocationSearchViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(locationViewModel)
        }
    }
}
