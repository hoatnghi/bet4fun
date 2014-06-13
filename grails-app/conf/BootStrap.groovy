import happybet.Role
import happybet.User
import happybet.UserRole

class BootStrap {

    def init = { servletContext ->
        if (!User.count()) {
            /*The default password is 'password'*/
            def password = 'admin'
            def user = new User(username: 'admin', password: password, enabled: true,
                    accountExpired: false, accountLocked: false, passwordExpired: false)
                    .save(flush: true)
            def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true, insert: true)
            def groupRole = new Role(authority: 'ROLE_GROUP').save(flush: true, insert: true)
            def userRole = new Role(authority: 'ROLE_USER').save(flush: true, insert: true)

            /*create the first user role map*/
            UserRole.create(user, adminRole, true)
        }
        Locale.setDefault(new Locale('vi_VN'))
    }
    def destroy = {
    }
}
