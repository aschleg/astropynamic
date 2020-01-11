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
