package hr

import org.hibernate.validator.constraints.Email

import javax.naming.Name

class Department {
    String departmentName
    String phoneNumber
    String email
    String description
//    ArrayList<Employee> employeeArrayList
    static hasMany = [Employee]
    static constraints = {
        departmentName()
        phoneNumber()
        email()
        description()
        departmentName unique: true
        phoneNumber unique: true
        email unique: true
        description nullable: true
        email email: true

    }
    static mapping = {
        id genarator:'sequence',
                column:'depId',
                params:[sequence:'DEPARTMENT_SEQ'],
                sqlType:'number'
    }

    @Override
    public String toString() {
        return departmentName
    }
}
