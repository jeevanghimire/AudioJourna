import SwiftUI
import Foundation
// Conforming to Identifiable
enum SideMenuOptionModel: Int, CaseIterable, Identifiable {
    case DashBoard
    case Home
    case TagSearch
    case Notifications

    // Providing unique 'id' for Identifiable conformance
    var id: Int { self.rawValue }

    var title: String {
        switch self {
        case .DashBoard:
            return "DashBoard"
        case .Home:
            return "Home"
        case .TagSearch:
            return "TagSearch"
        case .Notifications:
            return "Notifications"
        }
    }

    var systemImageName: String {
        switch self {
        case .DashBoard:
            return "filemenu.and.cursorarrow"
        case .Home:
            return "house.fill"
        case .TagSearch:
            return "magnifyingglass.circle.fill"
        case .Notifications:
            return "bell.fill"
        }
    }
}
