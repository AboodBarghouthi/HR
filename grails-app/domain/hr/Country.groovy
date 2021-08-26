package hr

class Country {
    String countryName
    int countryCode
    Region region
//    static belongsTo = Region
    static hasMany = [cities: City]
    static constraints = {

    }
    static mapping = {
        id generator: 'sequence',column:'country_Id' , params:[sequence:'COUNTRY_SEQ'],sqlType:'number'
    }
    @Override
    public String toString() {
        return  countryName
    }

}
