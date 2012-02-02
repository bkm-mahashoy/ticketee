require 'spec_helper'

describe TicketsController do

  let(:user) { create_user! }
  let(:project) { Factory(:project) }
  let(:ticket) { Factory(:ticket, project: project, user: user) }

  context "standard user" do

    before do
      sign_in(:user, user)
    end

    it "is not possible to view a ticket when the user cannot view project" do
      get :show, id: ticket.id, project_id: project.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The project could not be found.")
    end

    context "with permission to view the project" do

      before do
        Permission.create!(user: user, thing: project, action: "view")
      end

      def cannot_create_tickets!
        response.should redirect_to(project)
        flash[:alert].should eql("You cannot create tickets for this project.")
      end

      def cannot_update_tickets!
        response.should redirect_to(project)
        flash[:alert].should eql("You cannot edit tickets for this project.")
      end

      it "cannot access the page to begin creating a new ticket" do
        get :new, project_id: project.id
        cannot_create_tickets!
      end

      it "cannot create a ticket without permission" do
        post :create, project_id: project.id
        cannot_create_tickets!
      end

      it "cannot edit a ticket without permission" do
        get :edit, project_id: project.id, id: ticket.id
        cannot_update_tickets!
      end

      it "cannot update a ticket without permission" do
        put :update, project_id: project.id, id: ticket.id
        cannot_update_tickets!
      end

      it "cannot delete a ticket without permission" do
        delete :destroy, project_id: project.id, id: ticket.id
        response.should redirect_to(project)
        flash[:alert].should eql("You cannot delete tickets for this project.")
      end
    end
  end
end
