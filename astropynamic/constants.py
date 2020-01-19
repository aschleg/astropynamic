from astropynamic import const


class AU:
    km = const.au_km
    miles = const.au_miles


class DU:
    ft = const.du_ft
    miles = const.du_miles
    nm = const.du_nm
    km = const.du_km


class EarthRotation:
    angular_rotation = const.earth_angular_rotation
    deg_min = const.earth_deg_min
    rad_s = const.earth_rad_s
    radians_solarday = const.earth_radians_solarday


class Shape:
    semi_minor_axis_km = const.shape_semi_minor_axis_km
    earth_eccentricity = const.shape_earth_eccentricity
    earth_flattening = const.shape_earth_flattening


class TU:
    min = const.tu_min
    sec = const.tu_sec
    days = const.tu_days
