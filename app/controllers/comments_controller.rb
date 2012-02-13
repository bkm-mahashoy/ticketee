class CommentsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :find_ticket

  def create
    if !current_user.admin? && cannot?("change state".to_sym, @ticket.project)
      params[:comment].delete(:state_id)
    end

    @comment = @ticket.comments.build(params[:comment].merge(user: current_user))

    if @comment.save

      if can?(:tag, @ticket.project) || current_user.admin?
        @ticket.tag!(params[:tags])
      end

      redirect_to [@ticket.project, @ticket],
                  notice: "Comment has been successfully created."
    else
      flash[:alert] = "Comment has not been created."
      render template: "tickets/show"
    end
  end

  private

  def find_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end
end
