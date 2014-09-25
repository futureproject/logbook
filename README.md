#README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


## Names

There are lots of names in the TFP universe, and therefore lots of names in this app. Here's a guide.

- User
  Most users are Dream Directors. Some models belong to the User class, but store the foreign key as dream_director_id.

- Report
  Dream Directors file 4-6 reports each year about their Dream Team Students

- Testimonial
  Teachers work with Dream Directors to file a few testimonials about students each year

- Reflection
  Students file their own reflections, basically answering the prompt 'How are you doing?'

- authorize!
  Method that protects most of the app from anyone without a TFP email address

- authenticate!
  Much less restrictive gateway, allows Facebook sign in, for students.
