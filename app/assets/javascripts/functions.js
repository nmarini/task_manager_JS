$(() => {
    //put listeners here
    showListListener()
    
})

function showListListener() {
    $('button#show-lists').on("click", function(event) {
        event.preventDefault();
        $.get('/lists.json', function(resp) {
            resp.lists.forEach((li) => {
                let id = li.id
                let title = li.title;
                let userId = li.user.id;
                let list = new List(id, title, userId);
                li.tasks.forEach((task) => {
                    list.tasks.push({
                        completed: task.completed
                    })
                })
                let listItem = showList(list)
                $("ol#lists").append(listItem);
                $('button#show-lists').hide()
                showTasksListener(list) 
            })
        })
    })
}

function showList(list) {
    return `<li id="data-list-${list.id}">${list.title} <br> <b>Status:</b> ${list.completed()} <button id="show-list-${list.id}">Show</button><br>
    </li><br>`
}

function showTasksListener(list) {
    $(`button#show-list-${list.id}`).on("click", function(event) {
        event.preventDefault();
        $.get(`/lists/` + list.id + `.json`, function(resp){
            let li = resp.list
            showTasks(li);            
        })
       
    })
}

function showTasks(list) {
    $(`li#data-list-${list.id}`).append(`<ol id="list-${list.id}-tasks"></ol>`)
        list.tasks.forEach((task) => {
            $(`ol#list-${list.id}-tasks`).append(`<li id="list-${list.id}-task-${task.id}">${task.title} <br> <button id="show-task-${task.id}">Show</button></li><br>`)
            taskItemListener(task);
        })
}

function taskItemListener(task) {

}

function taskItem(task) {

}