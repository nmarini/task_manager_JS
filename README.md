# Task Manager
This app is designed to allow a user to create lists with tasks associated with those lists.  The tasks are then assigned to other users, who must accept the task and then complete the task.  Users are able to view their own lists and tasks, along with other users' lists and tasks.

## Installation

Clone the repository: git@github.com:nmarini/task_manager.git

Run: 
bundle install

Then Run:
thin start --ssl
  
Then visit:
https://localhost:3000
  
## Usage

A user is first directed to create an account or login (via an already exisiting account, or through Facebook).
After a user is loged in, they are directed to the home page which reveals all of their tasks with a notification if they are accepted or unaccepted.

A user's profile page has all of their created lists and tasks assigned to the user.  The user's profile page also notifies the user with a warning if the user has any unaccepted tasks.

The app also includes a Lists page that includes a list of every users' list.  They also include a link that directs a user to the list's info page.  The info page includes all of the tasks associated with the list.

Each task's info page includes the task's note, a status of "Complete" or "Incomplete", and a list of users assigned to the task.

Both lists and tasks can be edited and deleted.

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License
MIT License

Copyright (c) [2019] [Nicolas Marini]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.



-----------------------------------
