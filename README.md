### System Requirements
- **Rails**: Ensure Rails version 8.0.1 is installed

### Installation & Setup

1. **Clone the Repository**  
   ```sh
   git clone https://github.com/crolla97/conversation_timeline.git
   cd conversation_timeline
   ```
2. `bundle install`
3. `bin/rails db:setup`
4. `bin/rails db:migrate`
5. `bin/dev`
6. No password required to login, just create username


### Intro Video

https://github.com/user-attachments/assets/1d1932d4-a239-4ef5-a1e1-8647e86084b5


### Q&A

Q. Should we make the comments area independant of the projects model incase we need to add it elsewhere on the site?

A. Yes, making the comments area independent ensures it can be reused across different parts of the site, create it as a model concern.

Q. Will we want to handle different comments other than user and status updates in the future?

A. Yes, a flexible comment system allows for future expansion, make sure it is simple enough to add a new comment type
