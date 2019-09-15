#### Backend Developer Mini Project Assignment

##### Requirements
- PostgreSQL
- Ruby
- Rails


##### Build Project

On your terminal :

1. Clone or extract the file into your preferred folder
   ```
   (after extracting/cloning)
   cd your/folder/loket_mini_api
   ```

2. run bundle install to install the required gems
   ```
   bundle install
   ```

3. Database setup
   ```
   RAILS_ENV=test bundle exec rake db:create db:migrate
   RAILS_ENV=development bundle exec rake db:create db:migrate
   ```

4. Run Server
   ```
   rails s
   ```
   Your server will be ready on http://localhost:3000
   
 ##### List Of Endpoints
 
 ##### 1 - /location/create 
 
 + request
 
 ```
 curl -X POST http://localhost:3000/location/create \
  -H 'Content-Type: application/json' \
  -d '{ "name": "Aula Simfonia Jakarta", "address":"Gunung Sahari Kemayoran", "city":"Jakarta", "google_map_url":"https://www.google.com/maps/place/1"}' 
 ```
 + response
 
 ```
 {
 	"status": "ok",
 	"success": true,
 	"errors": [],
 	"data": {
 		"id": 12,
 		"name": "Aula Simfonia Jakarta",
 		"address": "Gunung Sahari Kemayoran",
 		"city": "Jakarta",
 		"google_map_url": "https://www.google.com/maps/place/2",
 		"created_at": "2019-09-15T14:51:46.495Z",
 		"updated_at": "2019-09-15T14:51:46.495Z"
 	}
 }
 ```
 
##### 2 - /event/create 

+ request
 
 ```
 curl -X POST http://localhost:3000/event/create \
 -H 'Content-Type: application/json' \
 -d '{ "location_id":1, "name":"We The Fest 2019", "category":"Public", "event_type":"Concert", "capacity":500, "organizer":"Ismaya", "start_date":"2019-10-10", "end_date":"2019-10-10", "start_time":"00:00:00", "end_time":"00:00:00", "description":"We The Fest 2019"}'
 ```
 
+ response

```
{
	"status": "ok",
	"success": true,
	"errors": [],
	"data": {
		"id": 11,
		"name": "We The Fest 2019",
		"category": "Public",
		"event_type": "Concert",
		"capacity": 500,
		"organizer": "Ismaya",
		"start_date": "2019-10-10",
		"end_date": "2019-10-10",
		"start_time": "2000-01-01T00:00:00.000Z",
		"end_time": "2000-01-01T00:00:00.000Z",
		"location_id": 1,
		"description": "We The Fest 2019",
		"created_at": "2019-09-15T15:32:54.897Z",
		"updated_at": "2019-09-15T15:32:54.897Z"
	}
}
```

##### 3 - /event/ticket/create 
+ request
```
curl -X POST http://localhost:3000/event/ticket/create \
-H 'Content-Type: application/json' \
-d '{"event_id":1, "name":"Diamond Ticket", "amount":500 ,"price":1250000, "description":"Diamond Ticket", "sale_start_date":"2019-09-01", "sale_end_date":"2019-09-11"}'
```
+ response

```
{
	"status": "ok",
	"success": true,
	"errors": [],
	"data": {
		"id": 19,
		"name": "Diamond Ticket",
		"amount": 500,
		"price": 1250000,
		"description": "Diamond Ticket",
		"sale_start_date": "2019-09-01",
		"sale_end_date": "2019-09-11",
		"event_id": 1,
		"created_at": "2019-09-15T15:30:26.179Z",
		"updated_at": "2019-09-15T15:30:26.179Z"
	}
}
```

##### 4 - /event/get_info

+ request
```
# /locations/:location_id/events/:event_id/get_info
# (check ASSUMPTIONS.md)

curl -X GET http://localhost:3000/locations/1/events/1/get_info
``` 

+ response
```
{
	"status": "ok",
	"success": true,
	"errors": [],
	"data": {
		"id": 1,
		"name": "LINE CONCERT",
		"category": "Concert",
		"event_type": "Public",
		"capacity": 100,
		"organizer": "CUBE Ent",
		"start_date": "2019-10-10",
		"end_date": "2019-10-11",
		"start_time": "2000-01-01T00:00:00.000Z",
		"end_time": "2000-01-01T08:00:00.000Z",
		"location": {
			"id": 1,
			"name": "Pasaraya Blok M",
			"address": "Melawai",
			"city": "Jakarta",
			"google_map_url": "https://www.google.com/maps/place/Pasaraya+Blok+M",
			"created_at": "2019-09-12T17:23:36.073Z",
			"updated_at": "2019-09-12T17:23:36.073Z"
		},
		"tickets": [{
			"id": 19,
			"name": "Diamond Ticket",
			"amount": 500,
			"price": 1250000
		}]
	}
}
```

##### 5 - /transaction/purchase

+ request
```
curl -X POST http://localhost:3000/transaction/purchase \
-H 'Content-Type: application/json' \
-d '{ "customer_id":1, "ticket_id":19, "amount":2 }'
```

+ response
```
{
	"status": "ok",
	"success": true,
	"errors": [],
	"data": {
		"id": 26,
		"customer_id": 1,
		"ticket_id": 19,
		"amount": 2,
		"created_at": "2019-09-15T15:39:50.867Z",
		"updated_at": "2019-09-15T15:39:50.867Z"
	}
}
```

##### 6 - /transaction/get_info/:customer_id

+ request
```
curl -X GET http://localhost:3000/transaction/get_info/1
```

+ response
```
{
	"status": "ok",
	"success": true,
	"errors": [],
	"data": {
		"id": 1,
		"first_name": "koko",
		"last_name": "lingga",
		"email": "koko.lingga",
		"phone": "+6282188887777",
		"transactions": [{
			"id": 25,
			"amount": 2,
			"ticket_name": "Diamond Ticket",
			"ticket_price": 1250000,
			"ticket_event_id": 1,
			"purchase_time": "2019-09-15T15:37:15.424Z"
		}, {
			"id": 26,
			"amount": 2,
			"ticket_name": "Diamond Ticket",
			"ticket_price": 1250000,
			"ticket_event_id": 1,
			"purchase_time": "2019-09-15T15:39:50.867Z"
		}]
	}
}
```