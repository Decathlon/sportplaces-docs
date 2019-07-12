# Sport Tags

## Introduction

<<<<<<< HEAD
A tag is associated with a sport place's activity and answers a YES/NO question. 
=======
A tag is associated with a sport place activity and answers a YES/NO question. 
>>>>>>> 6946f91206407b3e47801edfb65c8902215dda7e

_Ex: Does this place offer swimming lessons?_ 

becomes:

Does this place have the `swimming` **activity** with the `lessons` **tag**?

See the [activity tags](#activity-tags) section for a concrete example.

## List of available tags

<<<<<<< HEAD
Each tag has to be linked to a sport before being associated with an activity. Here's the full list of available tags.
=======
Each tag has to be linked to a sport before being associated with a sport place activity. Here's the full list of available tags.
>>>>>>> 6946f91206407b3e47801edfb65c8902215dda7e

* `catering`
* `changing_room`
* `club`
* `court_adjacent_to_others`
* `equipment_rental`
* `flat`
* `floodlight`
* `free`
* `free_parking`
* `grocery_store`
* `hourly_chargeable`
* `indoor`
* `isolated_court`
* `kids-pool`
* `lessons`
* `lifeguard`
* `members_only`
* `open-swim`
* `open-water`
* `outdoor`
* `paid_parking`
* `practice_wall`
* `security`
* `shower`
* `space_for_children`
* `speed`
* `suitable_for_beginners`
* `toilets`
* `washing_equipment`
* `water_fountain`
* `wave`
* `wheelchair_accessible`

The full list of sports is also available <a href="https://app.periscopedata.com/shared/92a812b0-d876-4dde-8d4a-b4b5b0a1f157?" target="_blank">on this dashboard</a>.

<aside class="notice">
If you want new tags that aren't part of the list, please submit them to
<a href="mailto:sportplacesapi@decathlon.com">sportplacesapi@decathlon.com</a>.

Ex: `washroom_available` 
</aside>

## Get a list of allowed tags for a sport

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/sports/186/tags"
```

> JSON response:

```json
[
  "free",
  "equipment_rental",
  "lessons",
  "outdoor",
  "space_for_children",
  "lifeguard",
  "beach",
  "indoor"
]
```

Retrieves a list of allowed tag names for a particular sport.

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/tags`

## Allow a tag for a sport

Not all tags are relevant to all sports. If you want a tag added to a specific sport, you can add it yourself by following the instructions below:

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

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/tags`

The tag needs to be part of the [list of available tags](#sport-tags) above.
