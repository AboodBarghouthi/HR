package hr

class Location {
    Country country
    City city
    String street
    String locationName
    String description
    String buildingNumber

    int postalCode
//    static belongsTo = Street
    static constraints = {
        country()
        city()
        street()
        locationName()
        description()
        buildingNumber()
    }
    static mapping = {
        id generator: 'sequence' ,column:'location_Id' , params:[sequence:'LOCATION_SEQ'],sqlType:'number'
    }
    @Override
    public String toString() {
        return  locationName

    }
}
