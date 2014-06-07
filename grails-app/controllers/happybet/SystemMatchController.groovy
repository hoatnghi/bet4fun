package happybet

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class SystemMatchController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SystemMatch.list(params), model:[systemMatchInstanceCount: SystemMatch.count()]
    }

    def show(SystemMatch systemMatchInstance) {
        respond systemMatchInstance
    }

    def create() {
        respond new SystemMatch(params)
    }

    @Transactional
    def save(SystemMatch systemMatchInstance) {
        if (systemMatchInstance == null) {
            notFound()
            return
        }

        if (systemMatchInstance.hasErrors()) {
            respond systemMatchInstance.errors, view:'create'
            return
        }

        systemMatchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'systemMatch.label', default: 'SystemMatch'), systemMatchInstance.id])
                redirect systemMatchInstance
            }
            '*' { respond systemMatchInstance, [status: CREATED] }
        }
    }

    def edit(SystemMatch systemMatchInstance) {
        respond systemMatchInstance
    }

    @Transactional
    def update(SystemMatch systemMatchInstance) {
        if (systemMatchInstance == null) {
            notFound()
            return
        }

        if (systemMatchInstance.hasErrors()) {
            respond systemMatchInstance.errors, view:'edit'
            return
        }

        systemMatchInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SystemMatch.label', default: 'SystemMatch'), systemMatchInstance.id])
                redirect systemMatchInstance
            }
            '*'{ respond systemMatchInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SystemMatch systemMatchInstance) {

        if (systemMatchInstance == null) {
            notFound()
            return
        }

        systemMatchInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SystemMatch.label', default: 'SystemMatch'), systemMatchInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemMatch.label', default: 'SystemMatch'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
