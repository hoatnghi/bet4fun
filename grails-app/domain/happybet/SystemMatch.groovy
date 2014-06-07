package happybet

class SystemMatch {

    String home
    String guess
    Date date
    int hScore
    int gScore
    float hRate
    float gRate

    static constraints = {
    }

    static belongsTo = [schedule: SystemSchedule]
}
