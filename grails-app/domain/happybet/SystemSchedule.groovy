package happybet

class SystemSchedule {

    String name
    Date startDate
    Date endDate

    static constraints = {
    }

    static hasMany = [matches: SystemMatch]
}
