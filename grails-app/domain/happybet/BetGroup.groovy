package happybet

class BetGroup {

    String name
    String description
    String owner
    Date expiredDate

    static constraints = {
    }

    static hasMany = [users: User, matches: BetMatch]
}
