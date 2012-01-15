def path_to(page_name)
  case page_name
    when /home/
    root_path
    else
    raise "No mapping for \"#{page_name} to a URL path."
  end
end
