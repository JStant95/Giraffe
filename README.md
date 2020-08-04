# Giraffe

## How to Install and Run

- Clone/fork repo
- run 'bundle install'
- start server with 'rackup'

Make a curl request to localhost:9292 including one of two parameters either 'actor' or 'film'. If an actor is provided, the
service should return a list of films featuring that actor. For example:

```
$ curl localhost:9292?actor=Macaulay_Culkin

{"films":["Home Alone","Saved!","The Pagemaster","The Wrong Ferarri","Party Monster (2003
film)","Home Alone 2: Lost in New York","Wish Kid","Adam Green's Aladdin","Sex and
Breakfast","My Girl (film)","Richie Rich (film)"]}
```

If a film is provided, it should return the cast of that film:

```
$ curl localhost:9292?film=Hellraiser

{"actors":["Ashley Laurence","Clare Higgins","Andrew Robinson (actor)"]}
```
