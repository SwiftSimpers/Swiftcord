import SwiftUI

struct HomeView: View {
  @EnvironmentObject var state: AppState

  var body: some View {
    HStack {
      DMListView()
        .frame(width: 260)
      if state.selectedChannel != nil {
        MessageListView()
      } else {
        HomeContentView()
      }
    }
  }
}
