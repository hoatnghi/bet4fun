package happybet

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
class AdminController {

    def betService

    def group() {
        render view: 'group', model: [groups: BetGroup.list()]
    }

    def createGroup () {
        def errMsg = betService.createGroup(params.name, params.description, params.owner, params.expiredDate)
        if (errMsg) {
            flash.error = errMsg
            render view: 'buildGroup'
            return
        }
        group()
    }

    def team() {
        render view: 'team', model: [teams: Team.list()]
    }

    def buildTeam() {
        def team
        if (params.teamId)
            team = Team.findById(params.teamId)

        def countriesMap = [:]
        def countries = Locale.getISOCountries()
        countries.each { country ->
            def locale = new Locale("", country)
            countriesMap.put(locale.getISO3Country().toLowerCase(), country.toLowerCase())
        }

        render view: 'buildTeam', model: [team: team, map: countriesMap]
    }

    def addTeam() {
        def errMsg = betService.addTeam(params.name, params.code)
        if (errMsg) {
            flash.error = errMsg
        } else {
            flash.message = 'Added ' + params.name + ' to group successfully.'
        }
        team()
    }

    def delTeam() {
        betService.delTeam(params.teamId)
        team()
    }

    def resets () {
        def users = User.list()
        users.each {user ->
            user.password = 'password'
            user.save(flush: true)
        }

        render "ok"
    }
}
