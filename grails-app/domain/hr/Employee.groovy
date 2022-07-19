package hr

import sun.security.pkcs.PKCS7

class Employee {
    Person personSsn
    String phoneNumber
    String email
    String emplpyeeTitle
    String emplpoyeeDescription
    Department department
    Double netSalary
//    static belongsTo = [Person,Department]

    static constraints = {
        phoneNumber nullable: true
        phoneNumber()
        email()
        emplpyeeTitle()
        emplpoyeeDescription()
        netSalary()
        department()
//        department()
    }

    static mapping = {
        id genarator: 'sequence', column:'empId',params:[sequence:'EMPLOYEE_SEQ'],sqlType:'number'
    }

}
