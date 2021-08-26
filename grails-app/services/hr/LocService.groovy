package hr

import grails.gorm.transactions.Transactional

@Transactional
class LocService {

    Location location = new Location()
 //   def s = location.get(Location)+getStreet().getCity().getCountry()
}
