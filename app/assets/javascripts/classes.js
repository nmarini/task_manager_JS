class User {
    constructor(name, email) {
        this.name = name;
        this.email = email;
        lists = [];
    }
}

class List {
    constructor(title, user) {
        this.title = title;
        this.user = user;
        tasks = [];
    }
}

class Task {
    constructor(title, note, completed, list) {
        this.title = title;
        this.note = note;
        this.completed = completed;
        this.list = list;
    }
}