package happybet

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_GROUP'])
class GroupController {

    def betService
    def userService

    def index() {
        render view: 'index', model: [groups: BetGroup.findAllByOwner(request.getRemoteUser())]
    }

    def matches () {
        def match = new BetMatch(params)
        if (params.matchId) {
            match = BetMatch.findById(params.matchId)
        }

        render view: 'matches', model: [groupId: params.groupId, matchId: params.matchId,
                                       betMatchInstance: match, teams: Team.list()]
    }

    def save() {
        if (params.matchId)
            betService.updateMatch(params.matchId, params.home, params.guess, params.date, Integer.valueOf(params.hScore),
                    Integer.valueOf(params.gScore), Float.valueOf(params.hRate), Float.valueOf(params.gRate),
                    Double.valueOf(params.amount), java.util.Calendar.getInstance(request.getLocale()).getTime())
        else
            betService.createMatch(params.group, params.home, params.guess, params.date, Integer.valueOf(params.hScore),
                    Integer.valueOf(params.gScore), Float.valueOf(params.hRate), Float.valueOf(params.gRate),
                    Double.valueOf(params.amount), java.util.Calendar.getInstance(request.getLocale()).getTime())
        redirect(controller: 'group')
    }

    def remove() {
        betService.deleteMatch(params.groupId, params.matchId)
        index()
    }

    def close() {
        betService.updateBetAmount(Long.valueOf(params.matchId))
        index()
    }

    def member() {
        render view: 'member', model: [groupId: params.groupId]
    }

    def addUser() {
        def errMsg = betService.addUserToGroup(params.group, params.email)
        if (errMsg) {
            flash.error = errMsg
        } else {
            flash.message = 'Added ' + params.email + ' to group successfully.'
        }
        member()
    }

    def delUser() {
        betService.removeUserFromGroup(params.groupId, params.userId)
        index()
    }

    def sysSchedules() {
        def schedules = SystemSchedule.findAllByEndDateGreaterThan(new Date())
        render view: 'sysSchedules', model: [schedules: schedules]
    }

    def importMatches() {
        def groups = BetGroup.findAllByOwner(request.getRemoteUser())
        groups.each { group ->
            betService.importMatches(params.id, group)
        }
        index()
    }

    def forget() {
        render(view: 'forget')
    }

    def reset() {
        def groups = BetGroup.findAllByOwner(request.getRemoteUser())
        def check = false
        groups.each {group ->
            group.users.each {user ->
                if (user.username.equals(params.email))
                    check = true
            }
        }
        if (check) {
            def errMsg = userService.resetPassword(params.email)
            if (errMsg) {
                flash.error = errMsg
            } else {
                flash.message = 'Please check your email for your credential.'
            }
        } else {
            flash.error = 'User not found in your group'
        }

        render(view: 'forget')
    }
}
