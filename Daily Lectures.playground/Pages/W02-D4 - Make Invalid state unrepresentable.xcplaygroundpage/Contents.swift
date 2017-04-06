
// user can provide email address, phone number, or both but cannot leave both blank.

struct NaiveContactInfo {
    let email: String?
    let phoneNumber: String?
}

let john = NaiveContactInfo(email: "john@wick.com", phoneNumber: nil)
let john2 = NaiveContactInfo(email: nil, phoneNumber: "867-5309")
let joker = NaiveContactInfo(email: nil, phoneNumber: nil)


enum ContactInfo {
    case email(String)
    case phoneNumber(String)
    case emailAndPhone(String, String)

    var email: String? {
        switch self {
        case .email(let value):
            return value
        case .emailAndPhone(let value, _):
            return value
        case .phoneNumber:
            return nil
        }
    }

    var phoneNumber: String? {
        switch self {
        case .email:
            return nil
        case .emailAndPhone(_, let value):
            return value
        case .phoneNumber(let value):
            return value
        }
    }

}

let susan = ContactInfo.email("susan@sarandon.com")
let john3: ContactInfo = .phoneNumber("867-5309")


susan.email
john3.email


