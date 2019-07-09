# Sport Tags

## Get a list of allowed tags for a sport

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/sports/186/tags"
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

`GET https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/tags`

## Allow a tag for a sport

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/sports/186/tags \
  -H 'Authorization: Bearer XXXXXX' \
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

* `beach`
* `equipment_rental`
* `free`
* `grocery_store`
* `lessons`
* `outdoor`
* `club`
* `space_for_children"`

<aside class="notice">
If you want new tags that aren't part of the list, please submit them to
<a href="mailto:sportplacesapi@decathlon.com">sportplacesapi@decathlon.com</a>.

Ex: washroom_available 
</aside>

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/tags`

## Remove a tag from a sport

```shell
curl -X DELETE \
  https://sportplaces.api.decathlon.com/api/v1/sports/186/tags/grocery_store \
  -H 'Authorization: Bearer XXXXXX' \
```

> JSON response:

```json
{
    "message": "Deleted"
}
```

Removes a specific tag from the allowed list for a given sport.

### HTTP Request

`DELETE https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/tags/TAG_SLUG`

