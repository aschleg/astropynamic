use constants

subroutine julian (year, month, day, hour, minute, second, julian_date)
    implicit none
    integer, intent(in) :: year, month, day, hour, minute
    real*8, intent(in) :: second
    real*8, intent(out) :: julian_date

    real*8 UT, Term1
    integer Term2, Term3

    Term1 = 367.000 * year
    Term2 = INT((7 * (year + INT((month + 9) / 12))) / 4)
    Term3 = INT(275 * month / 9)
    UT = ((second / 60.000 + minute) / 60.000 + hour) / 24.000

    julian_date = (Term1 - Term2 + Term3) + Day + 1721013.500 + UT

    return
    end subroutine


real*8 function greenwich_sidereal (julian_date)
    implicit none
    real*8, intent(in) :: julian_date
    real*8 temp, tu, radperday, twopi

    radperday = constants.radperday
    twopi = constants.twopi

    tu = ( DINT(julian_date) + 0.500 - 2451545.000 ) / (36525.000)
    temp = 1.75336855900 + 628.331970500 * tu + 6.7707081270 - 06 * tu ** 2 + radperday * DBLE (julian_date-DINT(julian_date) - 0.5)

    temp = DMOD (temp, twopi)
    if ( temp.LT.0.000) then
        temp = temp + twopi
    endif

    greenwich_sidereal = temp

    return
    end function


subroutine local_sidereal (julian_date, lon, lst)
    implicit none
    real*8, intent(in) :: julian_date, lon
    real*8, intent(out) :: lst

    external greenwich_sidereal
    real*8 twopi, greenwich_sidereal, gst

    twopi = 6.2831853071795900
    gst = greenwich_sidereal(julian_date)
    lst = lon + gst

    lst = DMOD ( lst, twopi)
    if (lst.lt.0.000) then
        lst = lst + twopi
    endif

    return
    end subroutine