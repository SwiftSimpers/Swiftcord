import SwiftUI

struct ChannelListView: View {
    @EnvironmentObject var state: AppState

    var body: some View {
        VStack {
            ScrollView(.vertical) {
                LazyVStack { }
            }
            UserInfoView()
                .frame(height: 40)
        }
    }
}
