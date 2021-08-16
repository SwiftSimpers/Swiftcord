//
//  ServerListView.swift
//  swiftcord
//
//  Created by Helloyunho on 2021/08/14.
//

import SwiftUI

struct ServerListView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                Button(action: {
                    print("home icon click")
                }) {
                    ZStack {
                        Circle()
                            .foregroundColor(Color("server-list-background"))
                        Image("discord-white-icon")
                            .resizable()
                            .scaledToFit()
                            .padding(8)
                    }
                    .aspectRatio(1, contentMode: .fit)
                }
                .buttonStyle(PlainButtonStyle())
                .contentShape(Circle())
                .padding(0)
                VStack { Divider() }
                ForEach(state.serverList) { server in
                    ServerListItem(server: server)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
        .padding(8)
        .background(
            VisualEffectView(
                material: .sidebar,
                blendingMode: .behindWindow
            )
        )
    }
}

#if DEBUG
struct ServerListViewPreview: View {
    @StateObject var state = AppState()

    var body: some View {
        ServerListView()
            .environmentObject(state)
    }
}

struct ServerListView_Previews: PreviewProvider {
    static var previews: some View {
        ServerListViewPreview()
            .frame(width: 50)
    }
}
#endif
