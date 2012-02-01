require 'spec_helper'

describe TicketsController do

  let(:user) { create_user! }
  let(:project) { Factory(:project) }
  let(:ticket) { Factory(:ticket, project: project, user: user) }

  context "standard user" do

    it "is not possible to view a ticket when the user cannot view project" do
      sign_in(:user, user)
      get :show, id: ticket.id, project_id: project.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The project could not be found.")
    end
  end
end
