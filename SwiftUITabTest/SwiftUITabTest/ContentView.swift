//
//  ContentView.swift
//  SwiftUITabTest
//
//  Created by Apple on 2022/1/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Text("ItemA Content")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Text("ItemB Content")
                .tabItem {
                    Image(systemName: "tv")
                    Text("TV")
                }
            
            Text("ItemC Content")
                .tabItem {
                    Image(systemName: "bag")
                    Text("Shop")
                }
            
            Text("ItemD Content")
                .tabItem {
                    Image(systemName: "sun.min")
                    Text("Notice")
                }
        }
        .accentColor(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
