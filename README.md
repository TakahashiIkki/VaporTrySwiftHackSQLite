# VaporTrySwiftHackSQLite

# Project
This is sample for Server-Side-Swift.
I tried "Vapor" (this is Server Side Swift framework).

I tried `CRUD` using Vapor by SQLite.

And now, I can `Create` and `Read`.

# How to Check

Please Set up Vapor.
[How to Setup Vapor](https://vapor.github.io/documentation/)

And so, Please `git clone` this project.

So After,

```
$ vapor build
$ vapor run serve
``` 

Then, Enter 
- GET `http://localhost:8080/users`  
-- You can get all of users table data.


- GET `http://localhost:8080/users/:id`  
-- You can get one of users table data by id.


- POST `http://localhost:8080/uses`  
-- You can save request data.

They are sample for features of routing by "Vapor".

# CopyLight
@2017 高橋　一騎 All Rights Reserved.

# Basic Template

A basic vapor template for starting a new Vapor web application. If you're using vapor toolbox, you can use: `vapor new --template=basic`

## 📖 Documentation

Visit the Vapor web framework's [documentation](http://docs.vapor.codes) for instructions on how to use this package.

## 💧 Community

Join the welcoming community of fellow Vapor developers in [slack](http://vapor.team).

## 🔧 Compatibility

This package has been tested on macOS and Ubuntu.
