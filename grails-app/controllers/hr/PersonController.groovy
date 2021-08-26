package hr

import grails.validation.ValidationException

import java.text.ParseException
import java.text.SimpleDateFormat

import static org.springframework.http.HttpStatus.*

class PersonController {

    PersonService personService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        println ("++++++++++++" + params)
        def search =Person.createCriteria()
        def res = search.list {
            if (params["txtSearch"]) {
                or {
                    like("firstName", params["txtSearch"])
                    like("lastName", params["txtSearch"])
//                    like("workID", params["txtSearch"])
//                    like("idNumber", params["txtSearch"])

                }
            }
            println("++++++++++++")



        }
        respond res , model: [personCount: personService.count()]
    }
//    def searchList (String searchText)
//    {
////        def searchPattern = "%" + params["searchText"] + "%"
//        def search =Person.createCriteria()
//        def res = search.list {
//            like("firstName", "searchText%")
////            like("firstName", search)
////            like("lastName", search)
//
//
//        }
////        return res.toString()
//    }

    def show(Long id) {
        respond personService.get(id)
    }

    def create() {
        respond new Person(params)
    }

    def save(Person person) {
//        Person person = new Person()
        if (person == null) {
            notFound()
            return
        }
        println("+++++++++++++++++++++++++++"+ params)
        try {

//            SimpleDateFormat formatter = new SimpleDateFormat("YYYY-MM-DD");
//            String dateInString = params.birthdate
//
//            try {
//
//                Date date = formatter.parse(dateInString);
//                System.out.println(date);
//                System.out.println(formatter.format(date));
//                person.birthdate = formatter.format(date)
//
//            } catch (ParseException e) {
//                e.printStackTrace();
//            }
            personService.save(person)
        } catch (ValidationException e) {
            respond person.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), person.id])
                redirect person
            }
            '*' { respond person, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond personService.get(id)
    }

    def update(Person person) {
        if (person == null) {
            notFound()
            return
        }

        try {
            personService.save(person)
        } catch (ValidationException e) {
            respond person.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'person.label', default: 'Person'), person.id])
                redirect person
            }
            '*'{ respond person, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        personService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'person.label', default: 'Person'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
