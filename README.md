# Toy App

This application demonstrates my knowledge building CRUD applications. In this web app, I used Ruby on Rails for serving both server and client side. On the client side, there's a bit usage of JavaScript for DOM manipulation. For the database, PostgreSQL is used.

Ruby: 3.2.0
Rails: 7.0.4.2
Cloud storage: Cloudinary

# Features

This web app has three user roles:

An **unauthorized(not logged in) user** can:

- **See all toy**. ![posts](https://i.imgur.com/ZrAoaCZ.png)
- **See specific toy.** ![specific toy](https://i.imgur.com/X7ACVmT.png)
- **See toys by user** 
- **Create an account**. The account must have an email, username, and password.

A **logged in user** can:

- **Create an account**. The account must have an email, username, and password.
- **Update their account**. They can change their password, username, and email.
- **See their account details.**
- **Delete their account** (includes their posts and comments due to FK constraint).
- **Create a toy post**. ![Creation menu](https://i.imgur.com/U377f4w.png)
- **Log out of their account.**

  The toy post has 4 attributes: Title, Content, Tags, and Images. The
  tags and images may be empty but not the first two.

- **See all toy**. ![posts](https://i.imgur.com/ZrAoaCZ.png)
- **See specific toy.** ![specific toy](https://i.imgur.com/X7ACVmT.png)
- **See toys by user** ![post by user](https://i.imgur.com/du00pPu.png)
- **Update toy post**. ![Update Toy](https://i.imgur.com/tYCkVdB.png) Update title, content, tags, or individual images of their posts.
- **Create a comment** to a post. ![Create comment](https://i.imgur.com/79hGKjw.png)
- **Update a comment** of their own.
- **Delete Toy post**, including the title, images, and comments.

An **admin** can:

- **See the dashboard** of every model/entity involved with the web app such as comments, tags, users, and toys.
- **See the user accounts, posts, comments, and tags** created.
- **Delete post, users, comments, and tags.**
- **Create tags.**
- **Update tags**.
- **See toys by users.**
