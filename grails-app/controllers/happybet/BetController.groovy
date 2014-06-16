package happybet

import grails.plugin.springsecurity.annotation.Secured

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
        def match = BetMatch.findById(params.matchId)
        def bets = match.bets
        def bet
        for (def i = 0 ; i < bets.size(); i++) {
            if (owner.equals(bets[i].owner)) {
                bet = bets[i]
                break;
            }
        }

        render view: 'bet', model: [bets: bets, bet: bet, match: match]
    }

    def takeBet() {
        def errMsg = betService.takeBet(params.matchId, request.getRemoteUser(), Integer.valueOf(params.choose),
                params.comment)
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

    def showByMatch() {
        def groups = User.findByUsername(request.getRemoteUser()).betGroups
        def gBets = [:]
        def totals = [:]
        groups.each { group ->
            def bets = Bet.createCriteria().list {
                createAlias('match', 'm')
                inList('match', group.matches)
                projections {
                    groupProperty('match')
                    sum('amount')
                }
                order('m.date')
            }
            gBets.put(group, bets)
            def total = 0
            bets.each { bet ->
                total += bet.getAt(1)
            }
            totals.put(group.id, total)
        }
        render view: 'showMatch', model: [groups: gBets, totals: totals]
    }

    def showByUser() {
        def groups = User.findByUsername(request.getRemoteUser()).betGroups
        def gBets = [:]
        def totals = [:]
        groups.each { group ->
            def bets = Bet.createCriteria().list {
                createAlias('match', 'm')
                inList('match', group.matches)
                projections {
                    groupProperty('owner')
                    sum('amount', 'total')
                }
                order('total', 'desc')
            }
            gBets.put(group, bets)
            def total = 0
            bets.each { bet ->
                total += bet.getAt(1)
            }
            totals.put(group.id, total)
        }
        render view: 'showUser', model: [groups: gBets, totals: totals]
    }
}
