<span class="product-title">Sport Places API</span>

# Get started

The Sport Places API can help you build sport-related applications requiring sport places. Here are a few steps to get you started:

**1. Sign up as an API User (mandatory).**

To keep our API Users happy and , we will want to make sure we can inform about exciting news, improvements and breaking changes.

Sign up by filling this form: <a href="https://mailchi.mp/decathlon/sportplacesapi" target="_blank">https://mailchi.mp/decathlon/sportplacesapi</a>

<p style="color:#0082c3;">IMPORTANT<br> You will receive the intructions to create your API Client Application in the email confirmation.</p>

**2. Make your first API Call**

```javascript
const axios = require('axios')

//
// Returns all the places where you can practice tennis in Montreal
//

const sportPlacesBaseUrl = 'https://sportplaces.api.decathlon.com/api/v1/places'
const coordinates = '-73.582,45.511' // Montreal Coordinates
const radius = 99 // Radius in km 
const sportId = 175 // Tennis Sport ID (see Sports API Documentation)

const { data } = await axios.get(`${sportPlacesBaseUrl}?origin=${coordinates}&radius=${radius}&sports=${sportId}`)

const places = data.data
```

For a quick proof of concept, we prepared this <a href="https://runkit.com/alextoul/sport-places-hello-world" target="_blank">Hello World script</a> on Runkit for you.

Output: 
![Tennis place in Montreal](https://i.ibb.co/Bf0x3z5/Screen-Shot-2019-07-17-at-10-35-53-AM.png)


Nice, isn't it? For the next step, let's make your first API call calling the sport places around you. Let's start with [this concrete example](#sport-places).