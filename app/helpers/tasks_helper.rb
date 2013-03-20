module TasksHelper
  def nested_tasks(tasks)
    tasks.map do |task, subtasks|
      render(task) + content_tag(:div, nested_tasks(subtasks), :class => "nested_tasks")
    end.join.html_safe
  end
end
