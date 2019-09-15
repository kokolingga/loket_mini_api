#### Backend Developer Mini Project Assignment

##### Assumtions
1. Before organizing event, we need location. 

    We will treat Location creation (`/location/create`) as the first step.

2. `Event` belongs to `Location`. Therefore we need to pass `:location_id` when we want to get the event's info. 

```
curl -X GET http://localhost:3000/locations/1/events/1/get_info
```