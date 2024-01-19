import Foundation

struct PaymentSectionViewModel: Equatable {
    let sectionCells: [PaymentViewModel]
}

struct PaymentViewModel: Equatable {
    let name: String
    let value: String
}
