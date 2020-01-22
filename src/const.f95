module constants
implicit none

    real*8, parameter :: au_km = 149599650.0
    real*8, parameter :: au_miles = 92955807.267433

    real*8, parameter :: du_ft = 20925646.325459318
    real*8, parameter :: du_miles = 3963.190591943
    real*8, parameter :: du_nm = 3443.918466523
    real*8, parameter :: du_km = 6378.137000000

    real*8, parameter :: earth_angular_rotation = 0.05883359068688786
    real*8, parameter :: earth_deg_min = 0.25068444793441402
    real*8, parameter :: earth_rad_s = 0.00007292115000000
    real*8, parameter :: earth_radians_solarday = 6.30038809866574

    real*8, parameter :: shape_semi_minor_axis_km = 6356.752314200
    real*8, parameter :: shape_earth_eccentricity = 0.08181919044260 ** 2
    real*8, parameter :: shape_earth_flattening = 1.0 / 298.257223563

    real*8, parameter :: tu_min = 13.44685108204
    real*8, parameter :: tu_sec = 806.81106492270
    real*8, parameter :: tu_days = 0.00933809102919444

    real*8, parameter :: radperday = 6.3003880986657400
    real*8, parameter :: twopi = 6.2831853071795900

end module constants