import Foundation
import Preferences
import SwiftUI

class GeneralPreferenceViewController: NSViewController, PreferencePane {
  public let preferencePaneIdentifier = Preferences.PaneIdentifier.general
  public let preferencePaneTitle: String = "General"
  public let toolbarItemIcon = NSImage(systemSymbolName: "gearshape", accessibilityDescription: "General preferences")!

  override var nibName: NSNib.Name? { "GeneralPreferenceViewController" }

  @IBOutlet var launchAtLoginButton: NSButton!

  override func viewDidLoad() {
    super.viewDidLoad()

    self.preferredContentSize = NSSize(width: 300, height: 300)
  }
}
