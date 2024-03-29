from math import floor


def cockroach_speed(s):
    return floor(s * 27.778)


def clever_cockroach_speed(s):
    return s // 0.036


# ONE_KM_IN_METERS = 1000
# ONE_METER_IN_CM = 100
# ONE_HOUR_IN_MINUTES = 60
# ONE_MINUTE_IN_SECONDS = 60

# def cockroach_speed(s):
#     cm = ONE_KM_IN_METERS * ONE_METER_IN_CM
#     sec = ONE_HOUR_IN_MINUTES * ONE_MINUTE_IN_SECONDS
#     return int((s * cm) / sec)
