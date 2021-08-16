//
//  ContentView.swift
//  swiftcord
//
//  Created by Helloyunho on 2021/08/14.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var serverList = [
        Server(
            id: 783_319_033_205_751_809,
            name: "Harmony",
            icon: nil // 40b7f82ea507e214a67f605eef963eb8
        ),
        Server(
            id: 837_903_552_570_720_307,
            name: "Harmony Dev",
            icon: "e29ce5dd2d5414dae0a265d3ce6e52a1"
        ),
    ]
    @Published var selectedServer: UInt64?
    @Published var selectedChannel: UInt64?

    init(selectedServer: UInt64? = nil, selectedChannel: UInt64? = nil) {
        self.selectedServer = selectedServer ?? serverList[0].id
        self.selectedChannel = selectedChannel
    }

    func getSelectedServer() -> Server? {
        if selectedServer == nil { return nil }
        else {
            return serverList.filter { $0.id == selectedServer }[0]
        }
    }
}

struct ContentView: View {
    @EnvironmentObject var state: AppState
    @State var verifiedHover = false

    var body: some View {
        // TODO(Dj):
        // We should probably also add a ZStack
        // as we'll need to add popout layer too
        // and a popout stack (for like multiple user profile popouts)
        // Like you click user and a user popout is added to
        // top level "layer" in ZStack
        HStack {
            ServerListView()
                .frame(width: 50)
            if state.selectedServer == nil {
                HomeView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                //  .navigationTitle("Test")
            } else {
                ServerView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .navigationTitle(state.selectedServer == nil ? "Discord" : state.getSelectedServer()!.name)
                //    .navigationBarTitleDisplayMode(.inline)
                //    .navigationSubtitle("test")
            }
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                ZStack {
                    Image("server-verified-icon-dark")
                        .resizable()
                        .scaledToFit()
                        .padding(4)
                    Image("server-verified-icon")
                        .resizable()
                        .scaledToFit()
                        .padding(4)
                        .opacity(verifiedHover ? 1 : 0)
                }
                .onHover { hover in
                    verifiedHover = hover
                }
                .animation(.easeInOut(duration: 0.25), value: verifiedHover)
            }
            ToolbarItemGroup {
                Image("server-verified-icon")
                    .resizable()
                    .scaledToFit()
                    .padding(4)
            }
        }
    }
}

#if DEBUG
    private struct ContentViewPreview: View {
        @StateObject var state = AppState()

        var body: some View {
            ContentView()
                .environmentObject(state)
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentViewPreview()
                .frame(width: 1000, height: 800)
        }
    }
#endif
