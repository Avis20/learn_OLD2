#!/usr/bin/env python3

from datetime import datetime
import geocoder

geo = geocoder.ip('me')
lat, long = geo.latlng

print(
    f"Latitude: {lat}",
    f"Longitude: {long}",
    f"Timestamp: {datetime.now()}",
    sep="\n"
)
