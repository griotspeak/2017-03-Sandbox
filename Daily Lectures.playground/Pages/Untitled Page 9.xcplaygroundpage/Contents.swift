enum BasicMedicalInquiry {}
enum CancerRelatedInquiry {}

protocol FourYearsOfMedicalSchool {
    func answerMedicalInquiry(_ inquiry: BasicMedicalInquiry) -> Bool
}

struct Oncologist : FourYearsOfMedicalSchool {
    func answerMedicalInquiry(_ inquiry: BasicMedicalInquiry) -> Bool {
        return true
    }

    func answerMedicalInquiry(_ inquiry: CancerRelatedInquiry) -> Bool {
        return false
    }
}

struct FamilyCareSpecialist : FourYearsOfMedicalSchool {
    func answerMedicalInquiry(_ inquiry: BasicMedicalInquiry) -> Bool {
        return true
    }
}

class Clinic {
    var freeAppointmentEmployee: FourYearsOfMedicalSchool
    init(freeAppointmentEmployee: FourYearsOfMedicalSchool) {
        self.freeAppointmentEmployee = freeAppointmentEmployee
    }

    func giveFreeBasicFiveMinuteAppointments(_ inquiry: BasicMedicalInquiry) {
        freeAppointmentEmployee.answerMedicalInquiry(inquiry)
    }
}