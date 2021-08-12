import EventKit
import ServiceManagement

private struct PreferencesKeys {
    static let backgroundIsTransparent = "backgroundIsTransparent"
}

class UserPreferences: ObservableObject {
    static let instance = UserPreferences()
    
    private init() {} // This prevents others from using the default '()' initializer for this class.
    
    private static let defaults = UserDefaults.standard
    
    @Published var backgroundIsTransparent: Bool = {
        guard UserDefaults.standard.object(forKey: PreferencesKeys.backgroundIsTransparent) != nil else {
            return true
        }
        return UserDefaults.standard.bool(forKey: PreferencesKeys.backgroundIsTransparent)
    }() {
        didSet {
            UserPreferences.defaults.set(backgroundIsTransparent, forKey: PreferencesKeys.backgroundIsTransparent)
        }
    }
    
}
