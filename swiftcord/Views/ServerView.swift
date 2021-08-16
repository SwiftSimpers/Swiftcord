import SwiftUI

struct ServerView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        HStack {
            ChannelListView()
                .frame(width: 100)
            MessageListView()
            MemberListView()
                .frame(width: 80)
        }
    }
}
