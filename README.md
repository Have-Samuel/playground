![](https://img.shields.io/badge/Microverse-blueviolet)

# Blog App:

> In this project,
***
## Milestone I:
***
> User Migration file to build schema.

[ERD Diagram](https://github.com/microverseinc/curriculum-rails/blob/main/blog-app/images/blog_app_erd.png)

### Basic Requirements:
***
* Create a new app.
* Initialize project with Git.
* project has Postgres database set up.
* Build your project schema.
* Create and run the necessary migration files.
* Table and column names should match the ERD diagram.
* note: photo for users table should be a link to an image
* Foreign keys should be included.
* All columns that are foreign keys should have a corresponding index.

## Milestone II:
***
> Setup models.

### Basic Requirements:
***
* Create a `User` model.
* Create a `Post` model.
* Create a `Comment` model.
* Create a `Tag` model.
* Setup associations between models.
* Create custom methods on models.

  * `User#most_recent_three_posts`
  * `Post#update_post_counter`
  * `Post#most_recent_five_comments`
  * `Like#update_like_counter`

## Milestone III:
***
> Add Validation for models and create specs for models.

### Basic Requirements:
***
* __For the User model:__
  * Name must not be blank.
  * PostsCounter must be an integer greater than or equal to zero.
* __For the Post model:__
  * Title must not be blank.
  * Title must not exceed 250 characters.
  * CommentsCounter must be an integer greater than or equal to zero.
  * LikesCounter must be an integer greater than or equal to zero.
* __Add unit specs for all of your models' methods and validations.__

## Milestone IV:
***
> create all controllers and views for the Blog app. Add simple placeholders for views with plain HTML.

### Basic Requirements:
***
* Create `user_posts`, `user_post`, `users` and `user` router
* Create a `UsersController` with action method for `index` and `show`
* Create a `PostsController` with action method for `index` and `show`
* Create a view files for `users` and `posts` with a placeholder for each.

## Milestone V:
***
> Set up tests on the `UsersController` and `PostsController`.
### Basic Requirements:
***
* Add RSpec as a gem to the project.
* Create a Request Spec for the `UsersController` and `PostsController`.
* The following test case are checked:
  * if response was successful, 
  * if a correct template was rendered.
  * if the response body includes correct placeholder text.

## Milestone VI:
***
> Add Views associated with the Models and Controllers already created in the Blog App
### Basic Requirements:
***
* Display all users in the `/users` page.
* Display a single user in the `/users/:id` page.
* Display all posts in the `/users/:user_id/posts` page.
* Display a single post in the `/users/:user_id/posts/:id` page.

## Milestone VII:
***
> Add forms to blog app
### Basic Requirements:
***
* Create a method called `current_user` in your ApplicationController.
  * It will return the first user from the database.
* Create forms to perform the following functions:
  * Creates a Post on behalf of the `current_user`.
  * Create a comment on behalf of the `current_user`.
* Allow Users to add likes to Posts.

#Author

👤 **Have Samuel**

- GitHub: [Have-Samuel](https://github.com/Have-Samuel)
- Twitter: [@samhave1](https://twitter.com/@samhave1)
- LinkedIn: [Have Samuel Kabreebe](https://linkedin.com/in/Have-Samuel-Kabreebe)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Have-Samuel/playground/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Microverse

## 📝 License

This project is [MIT](./MIT.md) licensed.