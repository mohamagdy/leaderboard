# Leadership
## Running the app
* `bundle`
* `rake db:create`
* `rake db:migrate`
* `rake db:seed`
* `rspec` to run the Rspec tests
* And finally, run the app `rails s` and visit `localhost:3000`

## Questions
** How would you test this?**

There are some `rsepc` tests in the `spec` directory. Possible testing scenarios are:
1. Retrieving only top 5 users
2. Sorting users with only the `level` field
3. Passing an invalid sorting field name. For example passing `sort=score` and the `score` attribute is not supported

** What would you do if you were told this needs to handle 1 million players?**

A possible approach is to cache for example the top 1000 users and expire the cache every 1 hour. When a request comes to the server instead of hitting the database the server hits the cache and sort the users saved in the cache
and retrieve them. 

Expiring the cache and the number of users saved in the cache depends on how fast the ordering change.