### Intro

This is the back-end part of my Unit 4 food tracker app. Originally built for my wife, the goal of the app is to allow users to quickly input meal information to track patterns with foods that may make them sick. This continues to be a work in progress but the majority of the basic functionality is there. As users input data, a chart dynamically updates with top triggers and emojis are placed inline with food items for more visual queues. 

### Challenges
This was my first project using Ruby on Rails. As such, there were some challenges in planning and later implementation of certain routes. Authentication proved to be more difficult than past projects.

Coming into this project one thing I wanted to do was make a full authentication system. I'd say I made in 80% of the way there and had a path to finish but due to time constraints and my desire to implement React Native, I decided to put pieces of this on hold. For example. Password reset is available, however, the password is not sent via email and is also reset immediately. Second, the password update function is also available and functioning, however no extra authentication is required, so any logged in user can change their password. Finally a ton of error checking happens but isn't apparent to the user.

### Technologies
Ruby on Rails and Postgresql as well as some gems such as Knock and Faker


### Next steps
While auth is basically complete, some functionality isn't finished as I spent more time implementing both React and React Native on the front end (original plan was just React). Password Reset works and will generate a new password, but it needs to be updated to send an email. Further checks on auth should be implemented for password reset and password update. For a more looks on charts on the front end, probably a good idea to retrun a few different arrays.

Also some unneeded routes exist and should be cleaned up.


### Other Links:

Front End Link:
https://github.com/StephenReiser/DietTrackerFrontEnd

React Native GitHub:
https://github.com/StephenReiser/DietTrackerNative