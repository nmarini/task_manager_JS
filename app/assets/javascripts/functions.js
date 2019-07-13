$(() => {
    //put listeners here
    showListListener()
    
})

function showListListener() {
    $('button#show-lists').on("click", function(event) {
        event.preventDefault();
        $.get('/lists.json', function(resp) {
            showLists(resp.lists);
        })
    })
}

function showLists(lists) {
    lists.forEach((li) => {
        let id = li.id
        let title = li.title;
        let userId = li.user.id;
        let list = new List(id, title, userId);
        li.tasks.forEach((task) => {
            list.tasks.push({
                id: task.id,
                title: task.title,
                completed: task.completed
            })
        })
        $("ol#lists").append(`<li id="data-list-${list.id}">${list.title} <br> <b>Status:</b> ${list.completed()} <button id="show-list-${list.id}">Show</button><br>
        </li><br>`);
        $('button#show-lists').hide()
        listTasksListener(list) 
    })
}
    

function listTasksListener(list) {
    $(`button#show-list-${list.id}`).on("click", function(event) {
        event.preventDefault();
        showListTasks(list);
        $(`button#show-list-${list.id}`).hide()
    })
}

function showListTasks(list) {
    $(`li#data-list-${list.id}`).append(`<ol id="list-${list.id}-tasks"></ol>`)
    list.tasks.forEach((task) => {
        $(`ol#list-${list.id}-tasks`).append(`<li id="list-${list.id}-task-${task.id}">${task.title} <br> <button id="show-task-${task.id}">Show</button></li><br>`)
        showTaskListener(list, task);
    })
}

function showTaskListener(list, task) { 
    $(`button#show-task-${task.id}`).on("click", function(event) {
        event.preventDefault();
        showTask(list, task);
        $(`button#show-task-${task.id}`).hide()
    })
}

function showTask(list, listTask) {
    $.get("/lists/" + list.id + "/tasks/" + listTask.id + ".json", function(resp) {
        let task = resp.task 
        $(`li#list-${list.id}-task-${task.id}`).append(`<ol id="task-${task.id}"></ol>`)
        $(`ol#task-${task.id}`).append(`<li id="task-${task.id}-info"> <b>Title:</b> ${task.title} <br>
            <b>Complete:</b> ${task.completed} <br>
            <b>Users Assigned:</b> <ol id="task-${task.id}-users"></ol> </li>`)
        appendTaskUsers(task, task.users)
    })
}

function appendTaskUsers(task, users) {
    users.forEach((user) => {
        $(`ol#task-${task.id}-users`).append(`<li>${user.name}</li>`)
    })
    
}