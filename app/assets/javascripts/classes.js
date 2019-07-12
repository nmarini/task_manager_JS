class User {
    constructor(id, name, email) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.lists = [];
    }
}

class List {
    constructor(id, title, userId) {
        this.id = id;
        this.title = title;
        this.userId = userId;
        this.tasks = [];
    }

    completed() {
        if (this.tasks.find((task) => {return task.completed === false})) {
            return "Incomplete"
        } else {
            return "Complete"
        }
    }
}

class Task {
    constructor(id, title, note, completed, listId) {
        this.id = id;
        this.title = title;
        this.note = note;
        this.completed = completed;
        this.listId = listId;
        this.users = [];
    }
}