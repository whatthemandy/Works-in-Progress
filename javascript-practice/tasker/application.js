// Object Literal - JSTasker:
var JSTasker = {
  updateTaskCounter: function() {
    var taskCount = $('div#tasks ul').children().not('li.completed').size();
    $('span#task_counter').text(taskCount);
  },

  sortTasks: function() {
    var taskList = $("#tasks").find("ul");
    var allCompleted = taskList.children('li.completed');
    allCompleted.detach();
    allCompleted.appendTo(taskList);
  },

  updatePage: function (){
    this.updateTaskCounter();
    this.sortTasks();
  }
};

// Doc-ready jQuery:
$(function(){
  $('form#add_task').on('submit', function(event){
    event.preventDefault();

    var taskText = $('input#task_text').val();
    var nameOfTask = ("<li>" + taskText + "</li>");
    var taskList = $("#tasks").find("ul");

    taskList.append(nameOfTask);
    $("#task_text").val("");
    $("#task_text").focus();
    JSTasker.updatePage();

    $("#tasks").on("click", "li", function(){
      $(this).toggleClass("completed");
      JSTasker.updatePage();
    });
  });
});
