require 'spec_helper'

describe CommentsController do
  let(:user) { create_user! }
  let(:project) { Project.create!(name: "Ticketee") }

  let(:ticket) do
    project.tickets.create(title: "State transitions",
                           description: "Can not be hacked.",
                           user: user)
  end

  let(:state) { State.create!(name: "New") }

  context "a user without permission to change the ticket state" do

    before do
      sign_in(:user, user)
    end

    it "cannot change the ticket state by passing in a state_id" do
      post :create, comment: { text: "Hacked!", state_id: state.id },
        ticket_id: ticket.id
      ticket.reload
      ticket.state.should == nil
    end
  end
end
