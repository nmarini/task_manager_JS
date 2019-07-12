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
                        id: task.id, 
                        title: task.title, 
                        note: task.note, 
                        completed: task.completed
                    })
                })
                let listItem = showList(list)
                $("ol#lists").append(listItem);
                $('button#show-lists').hide()
            })
        })
    })
}

function showList(list) {
    return `<li>${list.title} <br> <b>Status:</b> ${list.completed()} <button id="data-list-${list.id}">Show</button>
    </li><br>`
}

function ListTasksListener(list) {

}

function showTaskListener(task) {

}