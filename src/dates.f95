

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
    use constants
    implicit none
    real*8, intent(in) :: julian_date
    real*8 temp, tu

    tu = ( DINT(julian_date) + 0.500 - 2451545.000 ) / (36525.000)
    temp = 1.75336855900 + 628.331970500 * tu + 6.7707081270 - 06 * tu ** 2 + radperday * DBLE (julian_date-DINT(julian_date) - 0.5)

    temp = DMOD (temp, twopi)
    if ( temp<0.000) then
        temp = temp + twopi
    endif

    greenwich_sidereal = temp

    return
    end function


subroutine local_sidereal (julian_date, lon, lst)
    use constants
    implicit none
    real*8, intent(in) :: julian_date, lon
    real*8, intent(out) :: lst

    external greenwich_sidereal
    real*8 greenwich_sidereal, gst

    gst = greenwich_sidereal(julian_date)
    lst = lon + gst

    lst = DMOD ( lst, twopi)
    if (lst<0.000) then
        lst = lst + twopi
    endif

    return
    end subroutine


!subroutine inverse_julian (julian_date)
!    implicit none
!    real*8 temp, tu, days
!    integer year, month, day, hour, minute, sec, leapyears
!
!    temp = julian_date - 2415019.5
!    tu = temp / 365.25
!    year = 1900 + trunc(tu)
!    leapyears = trunc((year - 1900 - 1) / 4.0)
!    days = temp - ((year - 1900) * 365.0 + leapyears)
!
!    if (days < 1.0) then
!        year = year - 1
!        leapyears = trunc((year - 1900 - 1) / 4.0)
!        days = temp - ((year - 1900) * 365.0 + leapyears)
!    end if
!
!    return
!    end subroutine


!subroutine sunrise_sunset (julian_date, lat, lon, which, sunrise, sunset)
!    use constants
!    implicit none
!
!    real*8 julian_date, lat, lon, sunrise, sunset
!    character which
!    real*8 z, t, m, l, ra, sindelta, delta, h, sec, days, rad
!    integer year, month, day, hr, min
!
!    rad = 57.2957795130823000
!
!    if (which == 's') then
!        z = (90.000 + 50.000 / 60.000) / rad
!    elseif (which == 'c') then
!        z = 96.000 / rad
!    elseif (which == 'n') then
!        z = 102.000 / rad
!    elseif (which == 'a') then
!        z = 108.000 / rad
!    end if
!
!    end subroutine