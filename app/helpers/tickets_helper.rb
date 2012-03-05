module TicketsHelper

  def state_for(comment)
    content_tag(:div, class: "states") do
      if comment.state
        if comment.previous_state && comment.previous_state != comment.state
          "#{render comment.previous_state} &rarr; #{render comment.state}".html_safe
        else
          render(comment.state)
        end
      end
    end
  end

  def toggle_watching_ticket_button
    if @ticket.watchers.include?(current_user)
      button_text = "Stop watching this ticket"
    else
      button_text = "Start watching this ticket"
    end

    button_to button_text, watch_project_ticket_path(@ticket.project, @ticket)
  end
end
