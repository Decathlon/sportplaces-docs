# Activities

## Get a list of activities for a sport

```shell
curl "https://sportplaces-api.herokuapp.com/api/v1/places/8b1e3027-e438-42c2-92ab-5ebd23f68d54/activities"
```

> JSON response:

```json
{
    "160": {
        "tags": [],
        "difficulty": 2,
        "duration": 10,
        "distance": 10,
        "elevation_gain": 0,
        "cellphone_service": 1
    },
    "175": {
        "tags": [],
        "difficulty": 2,
        "distance": 10
    }
}
```

Retrieves a list of sporting activities at a place.

### HTTP Request

`GET https://sportplaces.herokuapp.com/api/v1/api/places/PLACE_UUID/activities`

## Add a new activity

```shell
curl -X POST \
  https://sportplaces.herokuapp.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities \
  -H 'apikey: XXXXXX' \
  -d '{
  "150": {
    "tags": ["free"],
    "cellphone_service": 1
  }
}'
```

> JSON response:

```json
{
    ...
    "150": {
        "tags": [
            "free"
        ],
        "cellphone_service": 1
    },
    ...
}
```

Adds a sporting activity to a place. Posted tags must be in the allowed list for the sport, and all properties should be
in the allowed filters for the sport.

### HTTP Request

`POST https://sportplaces.herokuapp.com/api/v1/places/PLACE_UUID/activities`

## Remove an activity from a place

```shell
curl -X DELETE \
  https://sportplaces.herokuapp.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities/150 \
  -H 'apikey: XXXXXX' \
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a sporting activity from a place based on its sport ID.

### HTTP Request

`DELETE https://sportplaces.herokuapp.com/api/v1/places/PLACE_UUID/activities/SPORT_ID`
