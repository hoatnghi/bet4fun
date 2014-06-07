package happybet

import grails.plugin.springsecurity.annotation.Secured

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
@Secured(['ROLE_ADMIN'])
class SystemScheduleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SystemSchedule.list(params), model:[systemScheduleInstanceCount: SystemSchedule.count()]
    }

    def show(SystemSchedule systemScheduleInstance) {
        respond systemScheduleInstance
    }

    def create() {
        respond new SystemSchedule(params)
    }

    @Transactional
    def save(SystemSchedule systemScheduleInstance) {
        if (systemScheduleInstance == null) {
            notFound()
            return
        }

        if (systemScheduleInstance.hasErrors()) {
            respond systemScheduleInstance.errors, view:'create'
            return
        }

        systemScheduleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'systemSchedule.label', default: 'SystemSchedule'), systemScheduleInstance.id])
                redirect systemScheduleInstance
            }
            '*' { respond systemScheduleInstance, [status: CREATED] }
        }
    }

    def edit(SystemSchedule systemScheduleInstance) {
        respond systemScheduleInstance
    }

    @Transactional
    def update(SystemSchedule systemScheduleInstance) {
        if (systemScheduleInstance == null) {
            notFound()
            return
        }

        if (systemScheduleInstance.hasErrors()) {
            respond systemScheduleInstance.errors, view:'edit'
            return
        }

        systemScheduleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SystemSchedule.label', default: 'SystemSchedule'), systemScheduleInstance.id])
                redirect systemScheduleInstance
            }
            '*'{ respond systemScheduleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SystemSchedule systemScheduleInstance) {

        if (systemScheduleInstance == null) {
            notFound()
            return
        }

        systemScheduleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SystemSchedule.label', default: 'SystemSchedule'), systemScheduleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'systemSchedule.label', default: 'SystemSchedule'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
