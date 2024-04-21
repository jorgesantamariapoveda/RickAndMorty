import SwiftUI

extension Character {
    var statusAndSpecieDescription: String {
        status.rawValue.capitalized + " - " + species
    }
    
    var statusColor: Color {
        switch self.status {
        case .alive: .green
        case .dead: .red
        case .unknown: .gray
        }
    }
}
