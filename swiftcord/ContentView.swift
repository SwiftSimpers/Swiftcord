//
//  ContentView.swift
//  swiftcord
//
//  Created by Helloyunho on 2021/08/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("yunho gay")
            .padding() // um so should we start
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Hi
// So I think we can divide Discord UI into a top level VStack
/**
 HStack { Z? H is horizontal don't we need vertical hmm
     ServerListView,
     ChannelOrDMorGDMList,
     MainView {
         one of these:
         ChannelView: HStack {
             MessagesView,
             MemberListView
         }
         HomeView
     }
 }
 */
// what is z stack
// oh so css z-index
// but wait why zstack
// got it
