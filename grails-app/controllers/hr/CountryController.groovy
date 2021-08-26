package hr

import grails.converters.JSON
import grails.validation.ValidationException
import org.springframework.context.annotation.Bean

import static org.springframework.http.HttpStatus.*

class CountryController {

    CountryService countryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]


    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond countryService.list(params), model:[countryCount: countryService.count()]
    }
//    static scaffold = Country
//
//    // just navigation to the gsp
//    def dynamicDropdown = {
//    }
//
//    def findCountry = {
//        def country = Country.get(countryName:Country.listOrderById())
//        render(template: 'citySelection', model:  [city: country.cities])
//    }
//    def findCityForCountry() {
//        def country=Country.get(params.country)
//        render(template: 'citySelection', model:  [cities: country.cities])
//    }
//
//    /*
//     * For the view
//     */
//    def selectChain() {
//        [countries : Country.list()]
//    }
//    def countrySelected()  {
//
//        Country country = Country.get(params.long('id'))
//        println ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>."+country
//        List<City> cities = City.findAllByCountry(country)
//        println("++++++++++++++++++++++++++++++++++++++++++++"+cities)
//        render cities as JSON
////        render g.select(optionKey: 'id', from: country.cities, id: 'city', name: "city")
//    }
        def c = {
            println(" oooo "+params.countryName)
        def country = Country.findById(Long.parseLong(params.countryName))
        println ("++++++"+ country)
        def typeList = country.cities
        println("**************"+ typeList)
        def cityList = [type:typeList]
        println ("---------------"+ cityList)
        render cityList as JSON
    }
    def show(Long id) {
        respond countryService.get(id)
    }

    def create() {
        respond new Country(params)
    }

    def save(Country country) {
        if (country == null) {
            notFound()
            return
        }

        try {
            countryService.save(country)
        } catch (ValidationException e) {
            respond country.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'country.label', default: 'Country'), country.id])
                redirect country
            }
            '*' { respond country, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond countryService.get(id)
    }

    def update(Country country) {
        if (country == null) {
            notFound()
            return
        }

        try {
            countryService.save(country)
        } catch (ValidationException e) {
            respond country.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'country.label', default: 'Country'), country.id])
                redirect country
            }
            '*'{ respond country, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        countryService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'country.label', default: 'Country'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'country.label', default: 'Country'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


}
