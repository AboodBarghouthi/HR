package hr

class Street {
    String streetName
    City city
//    static belongsTo = City
//    static hasMany = [Location]
    static constraints = {
    }
    static mapping = {
        id generator: 'sequence' ,column:'street_Id', params:[sequence:'STREET_SEQ'],sqlType:'number'
    }
    @Override
    public String toString() {
        return  streetName + " Street - " +  city  + " - "
    }
}
