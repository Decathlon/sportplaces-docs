# Sport Tags

## Get a list of allowed tags for a sport

```shell
curl "https://sportplaces-api.herokuapp.com/api/v1/sports/186/tags"
```

> JSON response:

```json
[
    "free",
    "outdoor",
    "lessons",
    "space_for_children"
]
```

Retrieves a list of allowed tag names for a particular sport. Use these when performing Place queries, or adding
activities to a place.

### HTTP Request

`GET https://sportsplaces.herokuapp.com/api/v1/api/sports/SPORT_ID/tags`

## Allow a tag for a sport

```shell
curl -X POST \
  http://sportplaces-api.herokuapp.com/api/v1/sports/186/tags \
  -H 'apikey: XXXXXX' \
  -d '{"slug": "grocery_store"}'
```

> JSON response:

```json
[
    "free",
    "outdoor",
    "lessons",
    "space_for_children",
    "grocery_store"
]
```

Adds a new tag to the allowed list for a specified sport. **MUST** be one of the following:

* `free`
* `grocery_store`
* `equipment_rental`
* `lessons`
* `outdoor`
* `space_for_children"`

### HTTP Request

`POST https://sportsplaces.herokuapp.com/api/v1/api/sports/SPORT_ID/tags`

## Remove a tag from a sport

```shell
curl -X DELETE \
  http://sportplaces-api.herokuapp.com/api/v1/sports/186/tags/grocery_store \
  -H 'apikey: XXXXXX' \
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a specific tag from the allowed list for a given sport.

### HTTP Request

`DELETE https://sportsplaces.herokuapp.com/api/v1/api/sports/SPORT_ID/tags/TAG_SLUG`
