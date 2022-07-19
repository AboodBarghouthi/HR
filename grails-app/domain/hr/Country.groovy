package hr
class Country {
//    static hasMany = [cities: City]
    String countryName
    int countryCode
    Region region


    static constraints = {

    }
    static mapping = {
        version false
        id generator: 'sequence',column:'country_Id' , params:[sequence:'COUNTRY_SEQ'],sqlType:'number'
    }
    @Override
    public String toString() {
        return  countryName
    }

}
