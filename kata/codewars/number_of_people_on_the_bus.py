def number(bus_stops):
    bus_count = 0
    for stop in bus_stops:
        bus_count += stop[0]
        bus_count -= stop[1]
    return bus_count

def bp_number(bus_stops):
    return sum([stop[0] - stop[1] for stop in bus_stops])

def clever_number(bus_stops):
    return sum(on - off for on, off in bus_stops)
