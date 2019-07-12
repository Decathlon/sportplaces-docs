# Sport Filters

## Introduction

A filter is associated with a sport place's activity. As opposed to tags that are boolean, their value ranges either as a numerical value or an array of values. 

_Ex: How long is this kayaking track?_ becomes _What is the value of the `distance` **filter**?_

## List of available filters

Each filter has to be linked to a sport before being associated with a sport place's activity. Here's the full list of available filters.

### Numerical filters 

* `cellphone_service`
* `courts`
* `court_size`
* `difficulty`
* `distance`
* `duration`
* `elevation_gain`
* `equipment`
* `field_size`
* `modality`
* `number_holes`
* `pool_size`
* `quality`
* `ring_size`
* `rink_size`
* `track_size`

### Filters with string values

* `age`: Adults, Kids, Teenagers
* `camping_accomodation`: RV, Tents
* `season`: Fall, Spring, Summer, Winter
* `surface`: clay, sand, etc.
* `swim_area`: Beach, Lake, Open Water, Pool
* `type_of_place`: club, hospital, hotel, public residence, school

The full list by sport is also available <a href="https://app.periscopedata.com/shared/92a812b0-d876-4dde-8d4a-b4b5b0a1f157?" target="_blank">through this dashboard</a>.

<aside class="notice">
If you want new filters that aren't part of the list, please submit them to
<a href="mailto:sportplacesapi@decathlon.com">sportplacesapi@decathlon.com</a>.

Ex: depth 
</aside>

## Get a list of allowed filters for a sport

```shell
curl "https://sportplaces.api.decathlon.com/api/v1/sports/186/filters"
```

> JSON response:

```json
[
    "size",
    "quality"
]
```

Retrieves a list of allowed filter names for a particular sport. 

### HTTP Request

`GET https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/filters`

## Allow a filter for a sport

```shell
curl -X POST \
  https://sportplaces.api.decathlon.com/api/v1/sports/186/filters \
  -H 'Authorization: Bearer XXXXXX' \
  -d '{"slug": "difficulty"}'
```

> JSON response:

```json
[
    "size",
    "quality",
    "difficulty"
]
```

Adds a new filter to the allowed list for a specified sport.

### HTTP Request

`POST https://sportplaces.api.decathlon.com/api/v1/sports/SPORT_ID/filters`
