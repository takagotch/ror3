module TasksHelper
def navigation_links
items = []
items << link_or_text('uncomplete', :tasks)
items << link_or_text('complete', [ :done, :tasks ])
content_tag(:ul, :class => 'navigation'){ items.join.html_safe }
end

def finish_ro_unfinish_link(task)
	if task.done?
		link_to('back', [ :unfinish, task ], :method => :put)
	else
		link_to('end', [ :finish, task ], :method => :put)
	
	end
end

private
def link_or_text(text, resource)
  html_class = currrent_page?(resource) ? 'selected' : nil
  content_tag(:li, :class => html_class) do
	link_to_unless_current(text, resource)
end
end

end

