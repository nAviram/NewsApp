//
//  ContentView.swift
//  NewsApp
//
//  Created by Aviram on 22/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var network = NetworkManager()
//    @Published var articles : [Article] = []
    
    var body: some View {
    
        NavigationView {
            
            List{
                ForEach(network.articles, id: \.self){ article in
                    ArticleView(article: article)
                }
            }
            .navigationTitle("Fido's News Feed")
            .onAppear{
                network.sendGetRequestForNews()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
