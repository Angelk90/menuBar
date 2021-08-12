import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var userPreferences = UserPreferences.instance
        
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let contentView = ContentView()
        popover.contentSize = NSSize(width: 560, height: 360)
        popover.contentViewController = NSHostingController(rootView: contentView)
        statusBar = StatusBarController.init(popover)
        DistributedNotificationCenter.default.addObserver(self,
                                                          selector: #selector(interfaceModeChanged(sender:)),
                                                          name: NSNotification.Name(rawValue: "AppleInterfaceThemeChangedNotification"),
                                                          object: nil)
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {}
    
    @objc func interfaceModeChanged(sender: NSNotification) {
        //popover.backgroundColor = colorScheme == .dark ? #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1) : #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        popover.backgroundColor = NSColor(named: "backgroundTheme")?.withAlphaComponent(userPreferences.backgroundIsTransparent ? 0.3 : 1.0)
        print("change")
    }
    
}
