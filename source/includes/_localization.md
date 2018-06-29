# Localization

```shell
curl "https://sportplaces-api.herokuapp.com/api/v1/places/:place_id"
  -H "Accept-Language:fr-CA"
```

Important bits of our data are localized, since it's meant to be used in
multiple countries/locales.

The way to retrieve/post data in a specific locale, such as `fr-CA` (Canadian
French), is to send the `Accept-Language` header along with your request (See
CURL request above).

Supported locales at the moment are:

`en, en-GB, fr-FR, fr-CA, pt-PT, pt-BR, es-ES, es-MX, it, de, ja, cn, pl`

Locales follow the [ISO
639-1](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes) convention. 

If your locale isn't listed, please [get in touch](developers@decathlon.com) and
we'll add it to the list.

At this moment the only supported column is `notes` for a place. We plan on localizing more data to cater to our users needs.
