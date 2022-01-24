//
//  ContentView.swift
//  SwiftUITabTest
//
//  Created by Apple on 2022/1/24.
//

import SwiftUI

enum TabItemType: String {
    case home = "Home"
    case tv = "TV"
    case shop = "Shop"
    case notice = "Notice"
    
    var image: Image {
        switch self {
        case .home:
            return Image(systemName: "house")
        case .tv:
            return Image(systemName: "tv")
        case .shop:
            return Image(systemName: "bag")
        case .notice:
            return Image(systemName: "sun.min")
        }
    }
    
    var text: Text {
        return Text(self.rawValue)
    }
}

struct TabItemView: View {
    let tabItemType: TabItemType
    
    var body: some View {
        VStack {
            tabItemType.image
            tabItemType.text
        }
    }
}

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = .blue
        UITabBar.appearance().unselectedItemTintColor = .green
    }
    var body: some View {
        TabView{
            Text("ItemA Content")
                .tabItem {
                    TabItemView(tabItemType: .home)
                }
            
            Text("ItemB Content")
                .tabItem {
                    TabItemView(tabItemType: .tv)
                }
            
            Text("ItemC Content")
                .tabItem {
                    TabItemView(tabItemType: .shop)
                }
            
            Text("ItemD Content")
                .tabItem {
                    TabItemView(tabItemType: .notice)
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
