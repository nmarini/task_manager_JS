class User {
    constructor(data) {
        this.id = data.id;
        this.name = data.name;
        this.email = data.email;
        this.lists = data.lists;
    }
}

class List {
    constructor(data) {
        this.id = data.id;
        this.title = data.title;
        this.user = data.user;
        this.tasks = data.tasks;
    }

    completed() {
        if (this.tasks.find((task) => {return task.completed === false})) {
            return "Incomplete"
        } else {
            return "Complete"
        }
    }
    formatShow() {
        let listHtml = `
        <h3>${this.title}<h3>
        <h5>Creator: ${this.user.name}</h5> 
        <a href="/lists/1/tasks/new">Add a Task</a>
        `
        return listHtml
    }

}

class Task {
    constructor(data) {
        this.id = data.id;
        this.title = data.title;
        this.note = data.note;
        this.completed = data.completed;
        this.list = data.list;
        this.users = data.users;
    }
}