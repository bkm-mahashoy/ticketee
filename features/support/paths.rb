def path_to(page_name)
  case page_name
  when /home/
    root_path

  when /([^\"]*)/
    project_path(Project.find_by_name!($1))

  else
    raise "No mapping for \"#{page_name}\" to a URL path."
  end
end
