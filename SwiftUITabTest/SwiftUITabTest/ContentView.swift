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

struct TabBarView: View {
    @Binding var index: Int
    var body: some View {
        HStack {
            Spacer()
            Button {
                self.index = 0
            } label: {
                if self.index != 0 {
                    TabItemView(tabItemType: .home)
                } else {
                    TabItemView(tabItemType: .home)
                }
            }
            Spacer()
            Button {
                self.index = 1
            } label: {
                if self.index != 1 {
                    TabItemView(tabItemType: .tv)
                } else {
                    TabItemView(tabItemType: .tv)
                }
            }
            Spacer()
            Button {
                self.index = 2
            } label: {
                if self.index != 2 {
                    TabItemView(tabItemType: .shop)
                } else {
                    TabItemView(tabItemType: .shop)
                }
            }
            Spacer()
            Button {
                self.index = 3
            } label: {
                if self.index != 3 {
                    TabItemView(tabItemType: .notice)
                } else {
                    TabItemView(tabItemType: .notice)
                }
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
