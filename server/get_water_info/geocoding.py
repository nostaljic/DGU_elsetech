import geopy


def get_geocode(location):
    service = geopy.Nominatim(user_agent='South Korea')
    geo = service.geocode(location)
    crd = (geo.latitude, geo.longitude)

    return crd
