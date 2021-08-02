import sys
import dbus
import argparse

parser = argparse.ArgumentParser()
parser.add_argument(
    '--type',
    type=str,
    required=True,
    metavar='The type of the output (current theme)',
    dest='type'
)
parser.add_argument(
    '--dbus',
    type=str,
    required=True,
    metavar='The correct dbus location to use (spotify or spotifyd)',
    dest='dbus'
)
parser.add_argument(
    '--max-length',
    type=int,
    metavar='The maximum length of the song name, artist and album name',
    dest='max_length',
    default=25
)

args = parser.parse_args()

def theme(type):
    switcher = {
        # Use {{ for a { and }} for a }
        'mountain fuji': '%{{T2}}%{{F#9EBF7E}}%{{F-}}%{{T3}}%{{B#9EBF7E}} %{{B-}}%{{T-}}%{{B#4c4e73}} {song}%{{B-}}%{{B#2a2940}}%{{T2}}%{{F#4c4e73}}%{{F-}}%{{T-}} {artist}%{{B-}}%{{T2}}%{{F#2a2940}}%{{F-}}%{{T-}}',
        'sunrise through trees': '%{{T2}}%{{F#686673}}%{{F-}}%{{T-}} {song} - {artist}',
        'trees in front of mountain': '%{{T2}}%{{F#829399}}%{{F-}}%{{T-}} {song} - {artist}',
    }

    return switcher.get( type.lower(), '{song} - {artist}')

def shorten(str, length = args.max_length):
    if len(str) > length:
        str = str[:length]
        str += '…'

        if ('(' in str) and (')' not in str):
            str += ')'

    return str

try:
    dbus_name = args.dbus

    session_bus = dbus.SessionBus()
    spotify_bus = session_bus.get_object(
        f'org.mpris.MediaPlayer2.{dbus_name}',
        '/org/mpris/MediaPlayer2'
    )

    spotify_properties = dbus.Interface(
        spotify_bus,
        'org.freedesktop.DBus.Properties'
    )

    metadata = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'Metadata')
    status = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'PlaybackStatus')

    # this should change...?
    #  loop_status = spotify_properties.Get('org.mpris.MediaPlayer2.Player', 'LoopStatus')

    artist = shorten( metadata['xesam:artist'][0] ) if metadata['xesam:artist'] else ''
    song = shorten( metadata['xesam:title'] ) if metadata['xesam:artist'] else ''
    album = shorten( metadata['xesam:album'] ) if metadata['xesam:album'] else ''

    if status == 'Paused' or (not artist and not song and not album):
        print('')
    else:
        type = args.type
        output = theme(type)

        print(
            output.format(
                artist=artist,
                song=song,
                album=album
            )
        )

except Exception as e:
    if isinstance(e, dbus.exceptions.DBusException):
        print('')
    else:
        print(e)

