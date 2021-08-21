"""
Python was screaming at me, so here it is
"""

STATE_CHARGING = "Charging\n"

with open("/sys/class/power_supply/BAT0/capacity", 'r') as file_capacity:
    with open("/sys/class/power_supply/BAT0/status", 'r') as file_state:
        end_string = ""
        capacity = int( file_capacity.read() )
        state = file_state.read()

        if state == STATE_CHARGING:
            end_string += "%{T3}%{F#829399}%{F-}%{T-}"
        else:
            if capacity < 10:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}%{F#f99f9b}"
            elif capacity < 25:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}"
            elif capacity < 50:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}"
            elif capacity < 75:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}"
            else:
                end_string += "%{T3}%{F#829399}%{F-}%{T-}"

        end_string += ' ' + str(capacity) + '%'

        if state != STATE_CHARGING and capacity < 10:
            end_string += "%{F-}"

        print(end_string)
