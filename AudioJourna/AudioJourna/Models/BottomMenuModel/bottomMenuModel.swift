import Foundation
enum bottomMeuModel: Int, CaseIterable, Identifiable {
    case BookMark
    case Home
    case Profile

    // Providing unique 'id' for Identifiable conformance
    var id: Int { self.rawValue }
    var systemImageName: String {
        switch self {
        case .BookMark:
            return "bookmark.fill"
        case .Home:
            return "house.fill"
        case .Profile:
            return"person.crop.circle.fill"
        }
    }
}

