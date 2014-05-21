Kickoff Rails
=============

## Purpose

I'm sick of recreating a user / admin / login model for rails / ember
applications, so is @jacojoubert. So we're building a thing to fork from 
when we start projects, and you are welcome to use it too.

## Sister Project

[Jaco's ember project is here](http://github.com/jacojouber/kickoff-ember)

## Users

To create a user you need *one* of:

1. A username
2. An email

If you create a user without a username the resource is identified by:

`/user/:user_id`

If you create a user with a username the resource is identified by:

`/:username`
