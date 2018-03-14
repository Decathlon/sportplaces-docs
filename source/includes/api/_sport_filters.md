# Sport Filters

## Get a list of allowed filters for a sport

```shell
curl "https://sportplaces-api.herokuapp.com/api/v1/sports/186/filters"
```

> JSON response:

```json
[
    "size",
    "quality"
]
```

Retrieves a list of allowed filter names for a particular sport. Use these when performing Place queries, or adding
activities to a place.

### HTTP Request

`GET https://sportplaces-api.herokuapp.com/api/v1/api/sports/SPORT_ID/filters`

## Allow a filter for a sport

```shell
curl -X POST \
  https://sportplaces-api.herokuapp.com/api/v1/sports/186/filters \
  -H 'apikey: XXXXXX' \
  -d '{"slug": "difficulty"}'
```

> JSON response:

```json
[
    "size",
    "quality"
    "difficulty"
]
```

Adds a new filter to the allowed list for a specified sport. **MUST** be one of the following:

* `surface`
* `difficulty`
* `duration`
* `elevation_gain`
* `cellphone_service`
* `distance`
* `size`
* `quality`

### HTTP Request

`POST https://sportplaces-api.herokuapp.com/api/v1/api/sports/SPORT_ID/filters`

## Remove a filter from a sport

```shell
curl -X DELETE \
  https://sportplaces-api.herokuapp.com/api/v1/sports/186/filters/difficulty \
  -H 'apikey: XXXXXX' \
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a specific filter from the allowed list for a given sport.

### HTTP Request

`DELETE https://sportplaces-api.herokuapp.com/api/v1/api/sports/SPORT_ID/filters/FILTER_SLUG`
