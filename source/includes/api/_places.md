# Places

## Search for places

```shell
curl "https://sportplaces-api.herokuapp.com/api/v1/places?origin=-73.582,45.511&radius=99&sports=175"
```

> JSON response:

```json
{
    "type": "FeatureCollection",
    "features": [
        {
            "type": "Feature",
            "properties": {
                "uuid": "8b1e3027-e438-42c2-92ab-5ebd23f68d54",
                "name": "McConnell Arena",
                "google_place_id": "ChIJ5XD-5zAayUwRIK7t7t89ZJ0",
                "contact_details": {
                    "email": null,
                    "phone": "+1 514-398-7017",
                    "website": null,
                    "booking_url": null,
                    "facebook_username": null
                },
                "address_components": {
                    "address": "3883 Rue University",
                    "city": "Montréal",
                    "province": "Québec",
                    "country": "CA"
                },
                "activities": {
                    "175": {
                        "tags": [],
                        "difficulty": 2,
                        "distance": 10
                    }
                }
            },
            "geometry": {
                "type": "Point",
                "coordinates": [
                    -73.5826985,
                    45.5119864
                ]
            }
        }
    ]
}
```

This endpoint retrieves all places meeting specific criteria

### HTTP Request

`GET https://sportplaces-api.herokuapp.com/api/v1/places`

### Query Parameters

Most parameters are optional, but certain logical combinations (such as `sw` and `ne`, or `origin` and `radius`)
must both be sent together if one is.

Coordinates (`sw`, `ne`, `origin`, `user_origin`) are comma separated string representations of geographic locations. As
per the GeoJSON standard, these are formatted as: `lng,lat` - the reverse of several other standards.

A bounding box (set by `sw` & `ne`), or the `radius` must not excede 100km in length.

Min/max value pairs do not both need to be specified. For example, use only `min_distance=300` to find activities with
a distance of over 300 metres, with no upper limit. 

The fields `difficulty`, `cellphone_service`, and `quality` are integer values `[0, 1, 2]` representing 
`['Beginner', 'Intermediate', 'Advanced']`, or `['poor', 'acceptable', 'good']`.

Search query errors will be responded to with specific error information, and an `HTTP 422` status code.

Parameter | Example | Description
--------- | ------- | -----------
sw | `'-73.58,45.51'` | Bounding box corner (South West)
ne | `'-73.08,45.91'` | Bounding box corner (North East)
origin | `'-73.58,45.51'` | Central point from which to search for places
radius | `10` | Number of kilometres around the origin to search
user_origin | `'-73.08,45.91'` | The current location of the end-user making the request. Used to calculate proximity.
sports | `'175,160'` | Filters results based on Decathlon Sport ID
tags | `'free,equipment_rental'` | Restricts search results to only those matching all set tags
surface | `clay,concrete` | Restricts search results to only those matching specified surface types
min_difficulty | `0` | Integer [0, 1, 2] representing the minimum difficulty level
max_difficulty | `2` | Integer [0, 1, 2] representing the maximum difficulty level
min_duration | `60` | Minimum number of minutes for the sporting activities
max_duration | `3660` | Maximum number of minutes allowed for the sporting activities
min_distance | `10` | Minimum required distance in metres for the activities
max_distance | `100` | Maximum allowed distance in metres for the activities
min_elevation_gain | `50` | Minimum required vertical elevation change in metres for the activities
max_elevation_gain | `250` | Maximum allowed vertical elevation change in metres for the activities
min_cellphone_service | `0` | Minumum required cell reception level in the area
max_cellphone_service | `2` | Maximum allowed cell reception level in the area
min_quality | `0` | Minumum required playing surface quality for the sporting activity
max_quality | `2` | Minumum required playing surface quality for the sporting activity
