require 'spec_helper'

describe ProjectsController do

  let(:user) do
    user = Factory(:user)
    user.confirm!
    user
  end

  let(:project) { Factory(:project) }

  context "standard user" do

    { new: :get,
      create: :post,
      edit: :get,
      update: :put,
      destroy: :delete }.each do |action, method|

      it "cannot access the #{action} action" do
        sign_in(:user, user)
        send(method, action, id: project.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to be able to do that.")
      end
    end
  end

  it "displays an error message for a missing project" do
    get :show, id: "does-not-exist"
    response.should redirect_to(projects_path)
    flash[:alert].should == "The project could not be found."
  end
end
