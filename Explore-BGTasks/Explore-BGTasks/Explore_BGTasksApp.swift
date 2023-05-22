//
//  Explore_BGTasksApp.swift
//  Explore-BGTasks
//
//  Created by Abhilash Palem on 07/12/22.
//

import SwiftUI
import BackgroundTasks

@main
struct Explore_BGTasksApp: App {
    let fileManager = FileManager.default
    
    @Environment(\.scenePhase) private var phase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: phase) { newPhase in
            switch newPhase {
            case .background:
                let request = BGAppRefreshTaskRequest(identifier: "com.shuttl.ios.BGTasks.TrackShuttl")
                do {
                    try BGTaskScheduler.shared.submit(request)
                    print("""
                        BG Task Scheduled. Now put a breakpoint on this line and execute
                    
                         e -l objc -- (void)[[BGTaskScheduler sharedScheduler] _simulateLaunchForTaskWithIdentifier:@"com.shuttl.ios.BGTasks.TrackShuttl"]
                        
                        to simulate background task execution
                    """)
                } catch {
                    print("Failed to schedule Task, \(error)")
                }
            default:
                break
            }
        }
        .backgroundTask(.appRefresh("com.shuttl.ios.BGTasks.TrackShuttl")) {
            do {
                let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
                let data = try await URLSession.shared.data(from: url).0
                let posts = try JSONDecoder().decode([Post].self, from: data)

                if var libDir = fileManager.urls(for: .libraryDirectory, in: .userDomainMask).first {
                    libDir.appendPathComponent("posts.json")
                    
                    if fileManager.fileExists(atPath: libDir.path) {
                        try fileManager.removeItem(at: libDir)
                    }
                    
                    let data = try JSONEncoder().encode(posts)

                    fileManager.createFile(atPath: libDir.path, contents: data)
                }
            } catch {
                return
            }
        }
    }
}
