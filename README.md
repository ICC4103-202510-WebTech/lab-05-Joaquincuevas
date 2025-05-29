## Lab 9 Changes and Implementations

### User Authentication (Devise)
- Integrated [Devise](https://github.com/heartcombo/devise) for user authentication.
- Registration now requires first name, last name, and email.
- Devise forms and shared links are styled with Bootstrap for a modern UI.
- The navbar displays a "Log in" button for guests and a "Log out" button for authenticated users, both aligned to the right.

### Authorization (CanCanCan)
- Added [CanCanCan](https://github.com/CanCanCommunity/cancancan) for authorization.
- **Users** can only edit or delete their own profiles.
- **Chats** can only be edited or deleted by users who are either the sender or receiver of the chat.
- **Messages** can only be edited or deleted by the user who sent them.
- All authorization checks are enforced both in controllers and views, so unauthorized actions and buttons are hidden from users who do not have permission.

### Bootstrap UI Enhancements
- All forms, navigation bars, and action buttons have been updated to use Bootstrap classes for a consistent and responsive design.
- Devise shared links and flash messages are styled for clarity and usability.

### Security
- All user input is validated.
- Sensitive actions are protected by authentication and authorization checks.
