"""
Python was screaming at me, so here it is
"""

STATE_CHARGING = "Charging\n"

AMOUNT_GOOD = 75
AMOUNT_ENOUGH = 50
AMOUNT_MEDIUM = 25
AMOUNT_LOW = 20

with open("/sys/class/power_supply/BAT0/capacity", 'r') as file_capacity:
    with open("/sys/class/power_supply/BAT0/status", 'r') as file_state:
        end_string = ""
        capacity = int( file_capacity.read() )
        state = file_state.read()

        if state == STATE_CHARGING:
            end_string += "%{T3}%{F#829399}%{F-}%{T-}"
        else:
            if capacity < AMOUNT_LOW:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}%{F#f99f9b}"
            elif capacity < AMOUNT_MEDIUM:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}"
            elif capacity < AMOUNT_ENOUGH:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}"
            elif capacity < AMOUNT_GOOD:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}"
            else:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}"

        end_string += ' ' + str(capacity) + '%'

        if state != STATE_CHARGING and capacity < AMOUNT_LOW:
            end_string += "%{F-}"

        print(end_string)
