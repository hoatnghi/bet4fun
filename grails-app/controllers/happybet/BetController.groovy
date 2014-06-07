package happybet

import grails.plugin.springsecurity.annotation.Secured
import org.hibernate.criterion.CriteriaSpecification

@Secured(['ROLE_USER'])
class BetController {

    def betService

    def index() {
        def bets = Bet.findAllByOwner(request.getRemoteUser())
        def user = User.findByUsername(request.getRemoteUser())
        render view: 'index', model: [bets: bets, groups: user.betGroups]
    }

    def bet() {
        def owner = request.getRemoteUser()
        def bets = BetMatch.findById(params.matchId).bets
        def bet
        for (def i = 0 ; i < bets.size(); i++) {
            if (owner.equals(bets[i].owner)) {
                bet = bets[i]
                break;
            }
        }

        render view: 'bet', model: [bets: bets, bet: bet]
    }

    def takeBet() {
        def errMsg = betService.takeBet(params.matchId, request.getRemoteUser(), Integer.valueOf(params.choose), params.comment)
        if (errMsg) {
            flash.message = errMsg
            bet()
            return;
        }
        index()
    }

    def result() {
        def bets = Bet.findAllByOwner(request.getRemoteUser())
        def user = User.findByUsername(request.getRemoteUser())

        render view: 'result', model: [bets: bets, groups: user.betGroups]
    }

    def showAll() {
        def groups = User.findByUsername(request.getRemoteUser()).betGroups
        groups.each { group ->
            group.matches.each { match ->
                def total = 0
                match.bets.each { bet ->
                    total += bet.amount
                }
                match.total = total
            }
            //betService.getAmountFundByGroup(group.id)
        }

        render view: 'show', model: [groups: groups]
    }
}
