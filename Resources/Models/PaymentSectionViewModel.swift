import Foundation

struct PaymentSectionViewModel: Equatable {
    let sections: [PaymentViewModel]
}

struct PaymentViewModel: Equatable {
    let name: String
    let value: String
}
