//
//  ContentView.swift
//  Diagrams
//
//  Created by Ihor Pedan on 24.12.2019.
//  Copyright © 2019 Ihor Pedan. All rights reserved.
//

import SwiftUI
import GitHubAPI
import News

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
            .onAppear {
                RepositoriesAPI.searchRepositories(q: "swift", l: "Swift") { (list, error) in
                    if list != nil {
                        print("GitHub succeed")
                    } else if error != nil {
                        print("GitHub failed")
                    }
                }
                ArticlesAPI.everythingGet(q: "swift", from: "2019-12-01", sortBy: "publishedAt", apiKey: "a9b0a70b40c7497fae2f6cff41567103") { (list, error) in
                    if list != nil {
                        print("News succeed")
                    } else if error != nil {
                        print("News failed")
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
