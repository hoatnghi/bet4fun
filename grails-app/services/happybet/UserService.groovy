package happybet

import grails.transaction.Transactional
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter

@Transactional
class UserService {
    def mailService
    def springSecurityService

    private static final String PASSWORD_REGEX = '^(?=.*\\d)(?=.*[a-zA-Z]).{4,8}$';

    def signUp(String email, String password, String confirmPass) {
        if(!email || !password || !confirmPass || password != confirmPass) {
            return 'Please fill up all required fields.'
        }
        User user = User.findByUsername(email)
        if (user) {
            return 'You have already been a valid user in our system.'
        }

        user = new User(username: params.email, password: params.password, enabled: true,
                accountExpired: false, accountLocked: false, passwordExpired: false).save(flush: true)
        def role = Role.findByAuthority('ROLE_USER')
        UserRole.create(user, role, true)
/*
        mailService.sendMail {
            to params.email
            subject 'Welcome to Happy Bet'
            body 'Your Account is as below: \n Username: ' + params.email + '\n Password: ' + user.password
        }
*/      return ''
    }

    def resetPassword(String email) {
        if (!email)
            return 'Please provide your email.'

        def user = User.findByUsername(email)
        if (!user)
            return 'Email not found'

        // may apply a way to auto generate password
        def generatePass = UUID.randomUUID().toString()
        user.password = generatePass
        user.save(flush: true)
        /*
        // send an email
        mailService.sendMail {
            to email
            subject 'Reset Password'
            body 'System is automatically generated a new password ' + generatePass
        }*/
        return ''
    }

    def changePassword(String username, String currentPassword, String newPassword, String confirmPassword) {
        /*
        String username = session[UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY] ?: springSecurityService.authentication.name
        if (!username) {
            flash.message = 'Sorry, an error has occurred'
            redirect controller: 'login', action:'auth'
            return
        }
        */
        if (!currentPassword || !newPassword || !confirmPassword || newPassword != confirmPassword) {
            return 'Please enter your current currentPassword and a new currentPassword'
        }
        User user = User.findByUsername(username)
        if (!springSecurityService.passwordEncoder.isPasswordValid(user.password, currentPassword, null /*salt*/)) {
            return 'Current currentPassword is incorrect'
        }
        if (springSecurityService.passwordEncoder.isPasswordValid(user.password, newPassword, null /*salt*/)) {
            return 'Please choose a different currentPassword from your current one'

        }
        /*
        if (!newPassword.matches(PASSWORD_REGEX)) {
            return 'Password does not meet minimum requirements'
        }
        */
        // success if we reach here!
        user.password = springSecurityService.encodePassword(newPassword)
        user.passwordExpired = false
        user.save()

        return "";
    }
}
