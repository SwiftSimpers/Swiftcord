import SwiftUI

struct HomeContentView: View {
  @EnvironmentObject var state: AppState

  var body: some View {
    HStack {
      FriendListView()
      HomeActivityView()
        .frame(width: 240)
    }
  }
}
