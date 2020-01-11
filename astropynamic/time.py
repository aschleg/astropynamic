import datetime
from astropynamic import dates


def julian_date(dt=None, year=None, month=1, day=1, hour=0, minute=0, second=0, modified=True):
    r"""
    Calculates the Julian date or modified Julian date (if specified).

    Parameters
    ----------
    dt : datetime, default None
        Datetime object to convert into a Julian date. Note if a datetime object is supplied to :code:`dt` the other
        parameters will not be evaluated. If None, returns the current datetime converted into a Julian date.
    year : int, str, default None
        Four digit year, such as 2019 or '2019'.
    month : int, default 1
        Month number. For example 1 = January, 12 = December.
    day : int, default 1
        Day of the month.
    hour : int, default 0
        Hour of the day.
    minute : int, default 0
        Minute of the day.
    second : int, default 0
        Second of the day.
    modified : boolean, default True
        If True, returns the modified Julian date, which is the computed Julian Date - 24000000.5.

    Returns
    -------
    float
        The computed Julian or Modified Julian date.

    Examples
    --------
    # Return the modified Julian Date for the current time.
    >>> julian_date()
    # Return the non-modified Julian Date for the current time.
    >>> julian_date(modified=False)
    # Get the modified Julian Date for 2019-01-01 at midnight.
    >>> julian_date(year=2019)

    Notes
    -----
    The equation for calculating the Julian date is defined as:

    .. math::

        J = 367(Year) - /large[ \large( \frac{7(Year + \frac{Month + 9}{12})}{4} \large). \large] +
        \frac{275(Month)}{9}. + Day + 1721013.5 + \frac{\large( \frac{\frac{Second}{60} + Minute}{60} \large) + Hour}{24}

    References
    ----------
    Capt. Vallado, David. Methods of Astrodynamics, A Computer Approach. USAF Academy, CO.

    """
    if all(p is None for p in (dt, year)):
        dt = datetime.datetime.now()

    if dt is None:
        dt = datetime.datetime(year=year, month=month, day=day, hour=hour, minute=minute, second=second)

    julian = dates.julian(year=dt.year, month=dt.month, day=dt.day, hour=dt.hour, minute=dt.minute, second=dt.second)

    if modified:
        julian -= 2400000.5

    return julian
