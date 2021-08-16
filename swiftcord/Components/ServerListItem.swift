//
//  ServerListItem.swift
//  swiftcord
//
//  Created by Helloyunho on 2021/08/15.
//

import Foundation
import SwiftUI

struct ServerListItem: View {
    @EnvironmentObject var state: AppState
    let server: Server
    @State var isHover = false

    var body: some View {
        GeometryReader { geometry in
            Button(action: {
                state.selectedServer = server.id
            }) {
                Group {
                    if let icon = server.icon {
                        AsyncImage(
                            url: URL(
                                string: "https://cdn.discordapp.com/icons/\(server.id)/\(icon).png"
                            )
                        ) { image in
                            image.resizable()
                        } placeholder: {
                            Color.clear
                        }
                    } else {
                        ZStack {
                            Color("server-list-background")
                            Text(getServerIconNamed(server.name))
                                .multilineTextAlignment(.center)
                        }
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: isHover ? 8 : geometry.size.width / 2))
                .animation(.easeInOut(duration: 0.1), value: isHover)
                .aspectRatio(1, contentMode: .fit)
            }
            .buttonStyle(PlainButtonStyle())
            .contentShape(RoundedRectangle(cornerRadius: isHover ? 8 : geometry.size.width / 2))
            .animation(.easeInOut(duration: 0.1), value: isHover)
            .onHover { hover in
                isHover = hover
            }
        }
    }
}

#if DEBUG
struct ServerListItem_Previews: PreviewProvider {
    static var previews: some View {
        ServerListItem(server: Server(id: 783_319_033_205_751_809, name: "Harmony", icon: nil))
            .frame(width: 70, height: 70)
    }
}
#endif
