# README

Testing Rails Action Text with Rails 5.2.2.1

Based on:
- https://www.driftingruby.com/episodes/using-action-text-in-a-rails-5-2-application

I run into some problem described in the end of this readme 

Things you may want to cover:

* Ruby version
  - 2.6.2
* Rails version
  - 5.2.2.1

* System dependencies
  - npm, yarn, sqlite, node

* How to run the test suite
```
docker-compose build
docker-compose up -d
docker-compose run web bash # Opens bash terminal at rails application
rails s # Open rails console

Test it!

determite ip of docker container `ip a`
Open http://172.25.0.2:3000/articles

```
### Problem
When you save an Article with some img inserted from your filesystem, there is no problem with it.

But when you copy img from internet, and paste it the create method went fine, but update is problematic. 
When you add some text to it or insert another img and save it, the changes are not saved.

- Open `http://172.25.0.3:3000/articles/3`
- Edit Text or Add some img
- Save 
  - No changes are done
