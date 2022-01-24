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
    var selected: Bool
    
    var body: some View {
        VStack {
            tabItemType.image
                .foregroundColor(selected ? .red : .blue)
            tabItemType.text
                .foregroundColor(.black)
        }
    }
}

struct TabBarView: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            Spacer()
            Button {
                self.index = 0
            } label: {
                TabItemView(tabItemType: .home, selected: self.index == 0)
                
            }
            Spacer()
            Button {
                self.index = 1
            } label: {
                TabItemView(tabItemType: .tv, selected: self.index == 1)
            }
            Spacer()
            Button {
                self.index = 2
            } label: {
                TabItemView(tabItemType: .shop, selected: self.index == 2)
            }
            Spacer()
            Button {
                self.index = 3
            } label: {
                TabItemView(tabItemType: .notice, selected: self.index == 3)
            }
            Spacer()
        }
    }
}

struct ContentView: View {
    @State var selection = 0
    
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
            Spacer()
            ZStack {
                if self.selection == 0 {
                    Text("ItemA Content")
                } else if self.selection == 1 {
                    Text("ItemB Content")
                } else if self.selection == 2 {
                    Text("ItemC Content")
                } else if self.selection == 3 {
                    Text("ItemD Content")
                }
            }
            Spacer()
            TabBarView(index: $selection)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
