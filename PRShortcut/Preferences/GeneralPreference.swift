import Defaults
import LaunchAtLogin
import SwiftUI

struct GeneralPreference: View {
  @Default(.githubUsername) var username
  @Default(.githubToken) var token

  var body: some View {
    Group {
      LazyVGrid(
        columns: [
          GridItem(.fixed(160), alignment: .topLeading),
          GridItem(.fixed(300)),
        ], spacing: 15
      ) {
        Text("GitHub Username:")
        TextField("GitHub Username", text: $username)

        Text("GitHub Token:")
        VStack {
          TextField("GitHub Token", text: $token)
          Text("Only if you want to see PRs in private reporitories (repo scope token only).")
        }

        LaunchAtLogin.Toggle()
      }
    }.frame(width: 500, height: 300)
  }
}
