package happybet

import java.text.SimpleDateFormat

/**
 * Created by haiquach on 6/13/14.
 */
class DateUtils {

    public static final TimeZone TIMEZONE = TimeZone.getTimeZone('UTC+7')
    private static final FULL_DATE_PATTERN = 'yyyy-MM-dd HH:mm:ss.sss'

    static boolean isFuture(Date date) {
        if (!date) return false
        if (converToTimeZone(date).before(new Date()))
            return true
    }

    static Date getNow() {
        Calendar cal = Calendar.getInstance(TIMEZONE)
        SimpleDateFormat sdf = new SimpleDateFormat(FULL_DATE_PATTERN)
        return sdf.parse(cal.format(FULL_DATE_PATTERN))
    }

    static Date convertFromTimeZone(Date date) {
        if (!date) return null
        Calendar cal = Calendar.getInstance(TIMEZONE)
        cal.setTime(date)
        SimpleDateFormat sdf = new SimpleDateFormat(FULL_DATE_PATTERN)
        sdf.setTimeZone(TIMEZONE)
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
