Factory.define :ticket do |ticket|
  ticket.title "Ticket Title"
  ticket.description "Ticket description ..."
  ticket.user { |u| u.association(:user) }
  ticket.project { |p| p.association(:project) }
end
