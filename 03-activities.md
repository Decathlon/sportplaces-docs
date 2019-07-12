# Activities

## Get a list of activities for a sport

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/places/8b1e3027-e438-42c2-92ab-5ebd23f68d54/activities"
```

> JSON response:

```json
[
    {
        "sport_id": 160,
        "tags": [],
        "difficulty": 2,
        "duration": 10,
        "distance": 10,
        "elevation_gain": 0,
        "cellphone_service": 1
    },
    {
        "sport_id": 160,
        "tags": [],
        "difficulty": 2,
        "distance": 10
    }
]
```

Retrieves a list of sporting activities at a place.

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities`

## Add a new activity

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{
  {
    "sport_id": 150,
    "tags": ["free"],
    "cellphone_service": 1
  }
}'
```

> JSON response:

```json
{
    ...
    "sport_id": 150,
    "tags": ["free"],
    "cellphone_service": 1
    ...
}
```

Adds a sporting activity to a place. Posted tags must be in the allowed list for the sport, and all properties should be
in the allowed filters for the sport.

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities`

## Update an activity

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities/150 \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{
  {
    "sport_id": 150,
    "tags": ["free"],
    "cellphone_service": 1
  }
}'
```

> JSON response:

```json
{
    ...
    "sport_id": 150,
    "tags": ["free"],
    "cellphone_service": 1
    ...
}
```

Updates a sporting activity at a place. Posted tags must be in the allowed list for the sport, and all properties should be
in the allowed filters for the sport. The activity must already exist at the location, else a 404 will be returned.


### HTTP Request

`PUT https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities/150`

## Update multiple activities

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{
    "activities": [
      {
        "sport_id": 150,
        "tags": ["free"],
        "cellphone_service": 1
      },
      {
        "sport_id": 175,
        "tags": ["lessons", "free"],
        "surface": "ice"
      }
    ]
}'
```

> JSON response:

```json
[
    {
        ...
        "sport_id": 150,
        "tags": ["free"],
        "cellphone_service": 1
        ...
    },
    {
        ...
        "sport_id": 175,
        "tags": ["lessons", "free"],
        "surface": "ice"
        ...
    },
]
```

Updates multiple sporting activities at a place. Posted tags must be in the allowed list for the sport, and all properties should be
in the allowed filters for the sport. If the activities do not exist, they will be created.

### HTTP Request

`PUT https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities`

## Remove an activity from a place

```shell
curl -X DELETE \
  https://sportplaces.api.decathlon.com/api/v1/places/9249f4b3-aff8-4e5c-8e76-9c79f4cf7bf3/activities/150 \
  -H 'Authorization: Bearer XXXXXX' \
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a sporting activity from a place based on its sport ID.

### HTTP Request

`DELETE https://sportplaces.api.decathlon.com/api/v1/places/PLACE_UUID/activities/SPORT_ID`

## Uploading Pictures to Activities

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/v1/places/*:place_id*/activities/*:activity_id*/images \
  -H 'Authorization: Bearer XXXXXX' \
  -H 'content-type: multipart/form-data' \
  -F '=@/path/to/the/image.png'
```

> JSON response:

```json
{
  "sport_id": 175,
  "tags": ["equipment_rental"],
  "photo_reference": "CmRaAAAAN3qk1mKFY6G...",
  "user": {
    "id": 1,
    "first_name": "Decathlon",
    "last_name": "Canada",
    "staff": true
  },
  "attributes": {},
  "image": {
    "url": "https://sportplaces.api.decathlon.com/remote/path/to/the/image.png"
  }
}
```

Pictures can be uploaded to an activity of a place via a file upload form as
such.

Only files of the image type are accepted (png, jpg, jpeg, bmp)

Uploads a picture to an activity within a place, based on the place ID and the
activity ID.

### HTTP Request

`POST https://sportplaces.api.decathlon.com/v1/places/:place_id/activities/:activity_id/images`
