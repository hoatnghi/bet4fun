package happybet

import grails.transaction.Transactional

@Transactional
class BetService {

    def createGroup(String name, String description, String owner, Date expiredDate) {
        def user = User.findByUsername(owner)
        if (!user) {
            def password = 'password'
            user = new User(username: owner, password: password, enabled: true,
                    accountExpired: false, accountLocked: false, passwordExpired: false)
                    .save(flush: true)
            def groupRole = Role.findByAuthority('ROLE_GROUP')
            def userRole = Role.findByAuthority('ROLE_USER')

            UserRole.create(user, groupRole, true)
            UserRole.create(user, userRole, true)
            /*
            mailService.sendMail {
                to params.email
                subject 'Welcome to Happy Bet'
                body 'Your Account is as below: \n Username: ' + params.email + '\n Password: ' + user.password +
                    '\n You are owner of group ' + name
            }
            */
        }

        def group = new BetGroup(name: name, description: description, owner: owner, expiredDate: expiredDate)
                .save(flush: true)
        //user.addToBetGroups(group)
        //user.save(flush: true)
        return ''
    }

    def addUserToGroup(String groupId, String email) {
        def user = User.findByUsername(email)
        if (!user) {
            def password = 'password'
            user = new User(username: email, password: password, enabled: true,
                    accountExpired: false, accountLocked: false, passwordExpired: false)
                    .save(flush: true)
            def userRole = Role.findByAuthority('ROLE_USER')
            UserRole.create(user, userRole, true)
            /*
            mailService.sendMail {
                to params.email
                subject 'Welcome to Happy Bet'
                body 'Your Account is as below: \n Username: ' + params.email + '\n Password: ' + user.password +
                    '\n You are owner of group ' + name
            }
            */
        }
        def group = BetGroup.findById(groupId)
        if (!group) {
            return 'There is some problems to add user to group'
        }
        if (group.users.contains(user)) {
            return email + " has been a member of " + group.name
        }

        user.addToBetGroups(group)
        user.save(flush: true)
        group.addToUsers(user)
        group.save(flush: true)

        return ''
    }

    def removeUserFromGroup(String groupId, String userId) {
        def user = User.findById(userId)
        if (!user) {
            return 'User not found'
        }
        def group = BetGroup.findById(groupId)
        if (!group) {
            return 'There is some problems to remove user from group'
        }
        user.removeFromBetGroups(group)
        user.save(flush: true)
        group.removeFromUsers(user)
        group.save(flush: true)

        // clean up bet
        Bet.executeUpdate("delete from Bet where owner=:owner", [owner:user.username])
    }

    def createMatch(String groupId, String home, String guess, Date date, int hScore, int gScore,
                    float hRate, float gRate, double amount) {
        BetGroup group = BetGroup.findById(groupId)
        if (!group) {
            return 'Unable to found group ' + groupId
        }
        def match = new BetMatch(home: Team.findById(home), guess: Team.findById(guess), date: date,
                hScore: hScore, gScore: gScore, hRate: hRate, gRate: gRate, amount: amount)
        if (date.before(new Date()))
            match.flagClosed = true

        match.save(flush: true)
        group.addToMatches(match)
        group.save(flush: true)
        if (date.before(Calendar.getInstance(new Locale('vi_VN')).getTime()))
            updateBetAmount(match.id)
    }

    def updateMatch(String matchId, String home, String guess, Date date, int hScore, int gScore,
                    float hRate, float gRate, double amount) {
        def match = BetMatch.findById(matchId)
        match.home = Team.findById(home)
        match.guess = Team.findById(guess)
        match.date = date
        match.hScore = hScore
        match.gScore = gScore
        match.hRate = hRate
        match.gRate = gRate
        match.amount = amount
        if (date.before(new Date()))
            match.flagClosed = true
        match.save(flush: true)
        if (date.before(Calendar.getInstance(new Locale('vi_VN')).getTime()))
            updateBetAmount(match.id)
    }

    def deleteMatch(String groupId, String matchId) {
        def group = BetGroup.findById(groupId)
        def match = BetMatch.findById(matchId)
        group.matches.remove(match)
        Bet.executeUpdate('delete from Bet where match=:match', [match: match])
        match.delete()
        group.save(flush: true)
    }

    def takeBet(String matchId, String userId, int choose, String comment) {
        def now = Calendar.getInstance(new Locale('vi_VN')).getTime()
        def match = BetMatch.findById(matchId)
        if (match.date.before(now))
            return "Match was closed for betting."
        def bet = Bet.findByMatchAndOwner(match, userId)
        if (!bet) {
            bet = new Bet(choose: choose, comment: comment, owner: userId, createDate: now,
                    match: match).save(flush: true)
        } else {
            bet.choose = choose
            bet.comment = comment
            bet.createDate = now
            bet.save(flush: true)
        }
        match.addToBets(bet)
        match.save(flush: true)
    }

    def importMatches(String scheduleId, BetGroup group) {
        def schedule = SystemSchedule.get(scheduleId)
        group.matches.each {match->
            Bet.executeUpdate("delete from Bet where match=:match", [match:match])
        }
        BetMatch.executeUpdate("delete from BetMatch where group=:group", [group:group])
        schedule.matches.each { obj ->
            def match = new BetMatch(home: obj.home, guess: obj.guess, date: obj.date, hScore: obj.hScore,
                    gScore: obj.gScore, hRate: obj.hRate, gRate: obj.gRate, amount: 0, group: group)
            match.save(flush: true)
            group.addToMatches(match).save(flush: true)
        }
        group.save(flush: true)
    }

    def updateBetAmount(Long matchId) {
        def match = BetMatch.findById(matchId)
        match.group.users.each {user ->
            def bet = Bet.findByOwnerAndMatch(user.username, match)
            if (bet) {
                def result
                if (bet.choose == 1) {
                    result = (match.hRate + match.hScore) - (match.gRate + match.gScore)
                } else if (bet.choose == -1) {
                    result =  (match.gRate + match.gScore) - (match.hRate + match.hScore)
                } else {
                    result = -1
                }
                if (result < 0) {
                    bet.amount = match.amount
                } else if (result == 0) {
                    bet.amount = match.amount / 2
                } else {
                    bet.amount = 0
                }
                bet.save(flush: true)
            } else {
                bet = new Bet(choose: 0, owner: user.username, createDate: new Date(),
                        match: match, amount: match.amount).save(flush: true, insert: true)
                match.addToBets(bet)
            }
        }
        match.flagClosed = true
        match.save(flush: true)
    }

    def addTeam(String name, String code) {
        def isoCode = iso3CountryCodeToIso2CountryCode(code)
        if (!name) {
            name = new Locale('', isoCode).getDisplayName()
        }

        def team = new Team(name: name, isoCode2: isoCode, isoCode3: code).save(flush: true)

        return ''
    }

    def delTeam(String teamId) {
        def team = Team.findById(teamId)
        if (!team) {
            return 'Team not found'
        }
        team.delete()
    }

    private String iso3CountryCodeToIso2CountryCode(String iso3CountryCode) {
        def countries = Locale.getISOCountries()
        for (def i = 0; i < countries.size(); i++) {
            def locale = new Locale("", countries[i])
            if (locale.getISO3Country().toLowerCase().equals(iso3CountryCode)) {
                return countries[i].toLowerCase()
            }
        }
    }
}
