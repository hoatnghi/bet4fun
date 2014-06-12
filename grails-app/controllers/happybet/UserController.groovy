package happybet

import grails.plugin.springsecurity.annotation.Secured

class UserController {

    def userService

    def index() {
        render(view: 'signup')
    }

    def signup() {
        def errMsg = userService.signUp(params.email, params.password, params.confirmPass)
        if(errMsg) {
            flash.error = errMsg
        } else {
            flash.message = 'An email has been sent to you. Please check your email for your credential.'
        }

        render(view: 'signup')
    }

    def change() {
        render(view: 'changePass')
    }

    def credential() {
        def errMsg = userService.changePassword(request.getRemoteUser(), params.currPass,
                params.newPass, params.confirmPass)
        if (errMsg) {
            flash.error = errMsg
        } else {
            flash.message = 'Password changed successfully.'
        }
        change()
    }

}
