package happybet

class Bet {

    Date createDate
    String owner
    int choose // 0: home, 1: guess
    double amount
    String comment

    static constraints = {
        comment nullable: true
    }

    static belongsTo = [match: BetMatch]
}
