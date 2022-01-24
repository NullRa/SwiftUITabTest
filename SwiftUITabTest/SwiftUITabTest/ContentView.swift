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
    @State var selection = 0
    init() {
        UITabBar.appearance().backgroundColor = .blue
        UITabBar.appearance().unselectedItemTintColor = .green
    }
    var body: some View {
        VStack {
            Button {
                let _ = print(selection)
                selection = (selection + 1)%4
            } label: {
                Text("Next Item Button")
                    .padding(3)
                    .border(.black, width: 1)
            }
            
            TabView(selection: $selection){
                Text("ItemA Content")
                    .tabItem {
                        TabItemView(tabItemType: .home)
                    }
                    .tag(0)
                
                Text("ItemB Content")
                    .tabItem {
                        TabItemView(tabItemType: .tv)
                    }
                    .tag(1)
                
                Text("ItemC Content")
                    .tabItem {
                        TabItemView(tabItemType: .shop)
                    }
                    .tag(2)
                
                Text("ItemD Content")
                    .tabItem {
                        TabItemView(tabItemType: .notice)
                    }
                    .tag(3)
            }
            .accentColor(.red)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
