require 'spec_helper'

describe ProjectsController do

  it "displays an error message for a missing project" do
    get :show, id: "does-not-exist"
    response.should redirect_to(projects_path)
    flash[:alert].should == "The project could not be found."
  end
end
