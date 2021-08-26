package hr

class Region {
    def regionService
    String regionName
    static hasMany = [Country]
    static constraints = {
    }

    static mapping = {
        id generator: 'sequence',
                column: 'region_Id',
                params: [sequence: 'REGION_SEQ'],
                sqlType: 'number'

    }

    @Override
    public String toString() {
        return regionName

    }
}