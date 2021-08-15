//
//  ServerListItem.swift
//  swiftcord
//
//  Created by Helloyunho on 2021/08/15.
//

import Foundation
import SwiftUI

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

struct ServerListItem_Previews: PreviewProvider {
    static var previews: some View {
        ServerListItem(server: Server(id: 783_319_033_205_751_809, name: "Harmony", icon: nil))
            .frame(width: 70, height: 70)
    }
}
