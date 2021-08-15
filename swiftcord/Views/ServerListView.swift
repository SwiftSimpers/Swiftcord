//
//  ServerListView.swift
//  swiftcord
//
//  Created by Helloyunho on 2021/08/14.
//

import SwiftUI

struct Server: Identifiable {
    let id: UInt64
    let name: String
    let icon: String?
}

struct ServerListItem: View {
    let server: Server

    var body: some View {
        Button(action: {
            print("server click")
        }) {
            Group {
                if let icon = server.icon {
                    AsyncImage(
                        url: URL(
                            string: "https://cdn.discordapp.com/icons/\(server.id)/\(icon).png"
                        )!
                    ) { image in
                        image.resizable()
                    } placeholder: {
                        Color.clear
                    }
                } else {
                    ZStack {
                        Color("server-list-background")
                        Text(server.name)
                            .multilineTextAlignment(.center)
                    }
                }
            }
            .clipShape(Circle())
            .aspectRatio(1, contentMode: .fit)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ServerListView: View {
    var serverList: [Server]

    var body: some View {
        VStack {
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
            Divider()
            ForEach(serverList) { server in
                ServerListItem(server: server)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(8)
    }
}

struct ServerListView_Previews: PreviewProvider {
    static var previews: some View {
        ServerListView(serverList: [
            // icon: "40b7f82ea507e214a67f605eef963eb8"
            Server(id: 783_319_033_205_751_809, name: "Harmony", icon: nil),
        ])
            .frame(width: 70, height: 600)
    }
}
