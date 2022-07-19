package hr

import groovy.time.TimeCategory

class Person {
    String personSsn
    String firstName
    String middleName
    String lastName
    GenderEnum gender
    Date birthdate
    String description
    Location location
//        static hasMany = [location:Location]
    static constraints = {
        personSsn ()
        firstName()
        middleName()
        lastName()
        gender()
        birthdate()
        description()
        location()
        personSsn nullable:false,blank:false, unique: true
        firstName nullable: false,blank: false
        middleName nullable: false,blank: false
        lastName nullable: false,blank: false
        gender nullable: false,blank: false
        birthdate nullable: false,validator: {val,obj ->
            def value = new Date().year - val.year
            if(value < 18){
                return ['age < 18']
            }
        }
        location nullable: true

        description nullable: true

    }
    static mapping = {
        id genarator:'sequence', column: 'person_de_id',  params:[sequence:'PERSON_SEQ'],sqlType:'number'
        tablePerHierarchy false
    }

//    @Override
    public String toString() {
        return personSsn;
    }
//    public Person(int ssn) {
//        this.personSsn = ssn
//    }
}
