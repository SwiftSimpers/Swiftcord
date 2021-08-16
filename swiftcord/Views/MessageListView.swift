import SwiftUI

struct MessageListView: View {
  @EnvironmentObject var state: AppState

  var body: some View {
    GeometryReader { geometry in
      Text("Width: \(geometry.frame(in: .local).size.width), Height: \(geometry.frame(in: .local).size.height)")
    }
  }
}
