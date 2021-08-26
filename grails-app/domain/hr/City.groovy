package hr

class City {
    String cityName
    int cityCode
//    Country country
    static belongsTo = [country:Country]
//    static hasMany =  [Street]
    static constraints = {
    }
    static mapping = {
        id generator: 'sequence' ,column:'city_Id', params:[sequence:'CITY_SEQ'],sqlType:'number'
    }
    @Override
    public String toString() {
        return  cityName

    }
}
