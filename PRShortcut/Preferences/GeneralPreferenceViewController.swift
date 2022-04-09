import Foundation
import Preferences
import SwiftUI

class GeneralPreferenceViewController: NSViewController, PreferencePane {
  public let preferencePaneIdentifier = Preferences.PaneIdentifier.general
  public let preferencePaneTitle: String = "General"
  public let toolbarItemIcon = NSImage(systemSymbolName: "gearshape", accessibilityDescription: "General preferences")!

  override func loadView() {
    let contentView = GeneralPreference()
    let hostingView = NSHostingView(rootView: contentView)

    self.view = hostingView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }
}
