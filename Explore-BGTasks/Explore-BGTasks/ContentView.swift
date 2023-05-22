//
//  ContentView.swift
//  Explore-BGTasks
//
//  Created by Abhilash Palem on 07/12/22.
//

import SwiftUI
/*
 links:
 - https://swiftwithmajid.com/2022/07/06/background-tasks-in-swiftui/
 - https://www.andyibanez.com/posts/modern-background-tasks-ios13/
 
 definitions:
 - we can handle background tasks using the SwiftUI app lifecycle
 
 Notes:
 - In iOS 13 and later, adding a BGTaskSchedulerPermittedIdentifiers key to the Info.plist disables the application(_:performFetchWithCompletionHandler:) and setMinimumBackgroundFetchInterval(_:) methods
 */
struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
