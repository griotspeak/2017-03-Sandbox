import Foundation

struct District {
    let number: Int
    let schools: [School] // this should probably be a set.
    let mostFamousAlumnus: Student?

    init(number: Int, schools: [School], mostFamousAlumnus: Student?) {
        self.number = number
        self.schools = schools
        self.mostFamousAlumnus = mostFamousAlumnus
    }
    init?(json: [String: Any]) {
        guard let number = json[District.numberKey] as? Int,
            let schoolsJson = json[District.schoolsKey] as? [[String: Any]],
            let schools = School.array(json: schoolsJson)
            else {
                return nil
        }

        let mfAlumJson = json[District.mostFamousAlumnusKey] as? [String: Any]
        let mfAlum = mfAlumJson.flatMap(Student.init(json:))

        self.init(number: number, schools: schools, mostFamousAlumnus: mfAlum)
    }

    static func array(json: Data) -> [District]? {
        guard let objects = (try? JSONSerialization.jsonObject(with: json, options: [])) as? [[String: Any]],
            let back = array(json: objects)
            else {
                return nil
        }
        return back
    }

    static func array(json: [[String: Any]]) -> [District]? {
        let back = json.flatMap(District.init(json:))
        guard back.count == json.count else {
            return nil
        }

        return back
    }

    static var numberKey: String = "number"
    static var schoolsKey: String = "schools"
    static var mostFamousAlumnusKey: String = "most_famous_alumnus"
}

struct School {
    let name: String
    let students: Set<Student> // this should probably be a set

    init(name: String, students: Set<Student>) {
        self.name = name
        self.students = students
    }

    init?(json: [String: Any]) {
        guard let name = json[School.nameKey] as? String,
            let studentsJson = json[School.studentsKey] as? [[String: Any]],
            let students = Student.set(json: studentsJson)
            else {
                return nil
        }

        self.init(name: name, students: students)
    }

    static func array(json: [[String: Any]]) -> [School]? {
        let back = json.flatMap(School.init(json:))
        guard back.count == json.count else {
            return nil
        }

        return back
    }

    static var nameKey: String = "name"
    static var studentsKey: String = "students"
}

final class Student : Hashable {
    let givenName: String
    let familyName: String

    init(givenName: String,
         familyName: String) {
        self.givenName = givenName
        self.familyName = familyName
    }

    convenience init?(json: [String:Any]) {
        guard let given = json[Student.givenNameKey] as? String,
            let family = json[Student.familyNameKey] as? String else {
                return nil
        }
        
        self.init(givenName: given, familyName: family)
    }

    // we still accept an array because JSON doesnt have Sets
    static func set(json: [[String: Any]]) -> Set<Student>? {
        let backArray = json.flatMap(Student.init(json:))
        let back = Set(backArray)
        guard back.count == json.count else {
            return nil
        }

        return back
    }


    static var givenNameKey: String = "given_name"
    static var familyNameKey: String = "family_name"

    var fullName: String {
        return "\(givenName) \(familyName)"
    }

    var hashValue: Int {
        return fullName.hashValue
    }

    static func == (_ lhs: Student, _ rhs: Student) -> Bool {
        return lhs.fullName == rhs.fullName
    }

}


let valleyHigh: [String: Any] = [
    School.nameKey : "Valley High",
    School.studentsKey : [
        [ Student.givenNameKey : "Brittany",
          Student.familyNameKey : "Daniel"],
        [ Student.givenNameKey : "Ryan",
          Student.familyNameKey : "Bittle" ],
        [ Student.givenNameKey : "Amy",
          Student.familyNameKey : "Danles" ]
    ]
]

let pacificCoast: [String: Any] = [
    School.nameKey : "Pacific Coast High",
    School.studentsKey : [
        [ Student.givenNameKey : "Kelly",
          Student.familyNameKey : "Packard" ],
        [ Student.givenNameKey : "Micheal",
          Student.familyNameKey : "Cade" ],
        [ Student.givenNameKey : "Aaron",
          Student.familyNameKey : "Jackson" ]
    ]
]

let jAndSHigh: [String:Any] = [
    School.nameKey : "J & S High",
    School.studentsKey : [
        [ Student.givenNameKey : "Ben",
          Student.familyNameKey : "Affleck" ],
        [ Student.givenNameKey : "Jason",
          Student.familyNameKey : "Mewes" ],
        [ Student.givenNameKey : "Kevin",
          Student.familyNameKey : "Smith" ]
    ]
]

let shawshank: [String:Any] = [
    School.nameKey : "Shawshank Middle",
    School.studentsKey : [
        [ Student.givenNameKey : "Morgan",
          Student.familyNameKey : "Freeman" ],
        [ Student.givenNameKey : "Tim",
          Student.familyNameKey : "Robbins" ],
        [ Student.givenNameKey : "Dana",
          Student.familyNameKey : "Snyder" ],
    ]
]

let sourceJsonObject: [[String: Any]] = [
    [District.numberKey : 12,
     District.schoolsKey : [
        valleyHigh,
        pacificCoast
        ],
     District.mostFamousAlumnusKey : [ Student.givenNameKey : "Brittany",
                                       Student.familyNameKey : "Daniel"]
    ],
    [District.numberKey : 3,
     District.schoolsKey : [
        jAndSHigh ,
        shawshank
        ]
    ]
]

let sourceJsonData = try! JSONSerialization.data(withJSONObject: sourceJsonObject, options: [.prettyPrinted])

if let districts = District.array(json: sourceJsonData) {
    print("districts successfully deserialized!")
    print(districts)
} else {
    print("deserialization failed")
}
