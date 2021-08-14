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
      AsyncImage(
        url: URL(
          string:
          server.icon != nil ?
            "https://cdn.discordapp.com/icons/\(server.id)/\(server.icon).png"
            : "https://discord.com/assets/9f6f9cd156ce35e2d94c0e62e3eff462.png"
        )
      )
      .clipShape(Circle())
      .frame(width: 60, height: 60)
    }
  }
}

struct ServerListView: View {
  var serverList: [Server]

  var body: some View {
    VStack {
      Button(action: {
        print("home icon click")
      }) {
        Image("discord-white-icon")
          .resizable()
          .frame(width: 60, height: 60)
      }
      Divider()
      ForEach(serverList) { server in
        ServerListItem(server: server)
      }
    }
    .frame(width: 70)
  }
}

struct ServerListView_Previews: PreviewProvider {
  static var previews: some View {
    ServerListView(serverList: [
      Server(id: 783_319_033_205_751_809, name: "Harmony", icon: "40b7f82ea507e214a67f605eef963eb8"),
    ])
      .frame(width: 70, height: 600)
  }
}
