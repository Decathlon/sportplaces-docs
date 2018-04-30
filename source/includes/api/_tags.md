# Activity Tags

## Get a list of tags on an activity

```shell
curl "https://sportplaces-api.herokuapp.com/api/v1/places/8b1e3027-e438-42c2-92ab-5ebd23f68d54/activities/160/tags"
```

> JSON response:

```json
[
    "free"
]
```

Retrieves a list of tags that have been applied to a sporting activity at a place

### HTTP Request

`GET https://sportplaces-api.herokuapp.com/api/v1/places/PLACE_UUID/tags`

## Add a tag to an activity

```shell
curl -X POST \
  https://sportplaces-api.herokuapp.com/api/v1/places/8b1e3027-e438-42c2-92ab-5ebd23f68d54/activities/160/tags \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{
	  "slug": "lessons"
  }'
```

> JSON response:

```json
[
    "free",
    "lessons"
]
```

Adds a new tag to a sporting activity at a specified place. This tag **MUST** be permitted on a sport.

### HTTP Request

`POST https://sportplaces-api.herokuapp.com/api/v1/places/PLACE_UUID/tags`

## Remove a tag from an activity

```shell
curl -X DELETE \
  https://sportplaces-api.herokuapp.com/api/v1/places/8b1e3027-e438-42c2-92ab-5ebd23f68d54/activities/160/tags/lessons \
  -H 'Authorization: Bearer XXXXXX'
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a specific tag from a sporting activity at a location.

### HTTP Request

`DELETE https://sportplaces-api.herokuapp.com/api/v1/places/PLACE_UUID/activities/SPORT_ID/tags/lessons`
