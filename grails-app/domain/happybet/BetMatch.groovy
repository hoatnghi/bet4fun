package happybet

class BetMatch {

    Team home
    Team guess
    Date date
    int hScore
    int gScore
    float hRate
    float gRate
    double amount
    boolean flagClosed
    transient double total

    static constraints = {
    }

    static hasMany = [bets: Bet]
    static belongsTo = [group: BetGroup]

    def getName() {
        return home.name + ' vs ' + guess.name
    }
}
