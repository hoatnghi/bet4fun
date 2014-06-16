package happybet

import java.text.SimpleDateFormat

/**
 * Created by haiquach on 6/13/14.
 */
class DateUtils {

    public static final TimeZone TIMEZONE = TimeZone.getTimeZone('GMT+9')
    private static final FULL_DATE_PATTERN = 'yyyy-MM-dd HH:mm:ss.sss'

    static boolean isFuture(Date date) {
        if (!date) return false
        if (convertFromTimeZone(new Date()).before(date))
            return true
        return false
    }

    static Date getNow() {
        return convertFromTimeZone(new Date())
    }

    static Date convertFromTimeZone(Date date) {
        if (!date) return null
        Calendar cal = Calendar.getInstance(TIMEZONE)
        cal.setTime(date)
        cal.setTimeZone(TIMEZONE)
        SimpleDateFormat sdf = new SimpleDateFormat(FULL_DATE_PATTERN)
        return sdf.parse(cal.format(FULL_DATE_PATTERN))
    }

    static Date converToTimeZone(Date date) {
        return convertToTimeZone(date, TIMEZONE)
    }

    static Date convertToTimeZone(Date date, TimeZone timeZone) {
        if (!date) return null
        Calendar cal = Calendar.getInstance()
        cal.setTime(date)
        SimpleDateFormat sdf = new SimpleDateFormat(FULL_DATE_PATTERN)
        sdf.setTimeZone(timeZone)
        return sdf.parse(cal.format(FULL_DATE_PATTERN))
    }
}
