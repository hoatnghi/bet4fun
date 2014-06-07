package happybet

class Team {

    String name
    String isoCode2
    String isoCode3

    static constraints = {
        name nullable: false, blank: false, unique: true
        isoCode2 nullable: false, blank: false, unique: true
        isoCode3 nullable: false, blank: false, unique: true
    }
}
