from astropynamic import const
from numpy import float32


class AU:
    km = float32(const.constants.au_km)
    miles = float32(const.constants.au_miles)


class DU:
    ft = float32(const.constants.du_ft)
    miles = float32(const.constants.du_miles)
    nm = float32(const.constants.du_nm)
    km = float32(const.constants.du_km)


class EarthRotation:
    angular_rotation = float32(const.constants.earth_angular_rotation)
    deg_min = float32(const.constants.earth_deg_min)
    rad_s = float32(const.constants.earth_rad_s)
    radians_solarday = float32(const.constants.earth_radians_solarday)


class Shape:
    semi_minor_axis_km = float32(const.constants.shape_semi_minor_axis_km)
    earth_eccentricity = float32(const.constants.shape_earth_eccentricity)
    earth_flattening = float32(const.constants.shape_earth_flattening)


class TU:
    min = float32(const.constants.tu_min)
    sec = float32(const.constants.tu_sec)
    days = float32(const.constants.tu_days)
