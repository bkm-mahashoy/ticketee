require 'spec_helper'

describe FilesController do
  let(:project) { Factory(:project) }
  let(:ticket) { Factory(:ticket, project: project) }
  let(:user_with_access) { create_user! }
  let(:user_no_access) { create_user! }
  let(:path) { "#{Rails.root}/spec/fixtures/speed.txt" }
  let(:asset) { ticket.assets.create(asset: File.open(path)) }

  before do
    user_with_access.permissions.create! action: "view", thing: project
  end

  context "user with access" do
    before do
      sign_in(:user, user_with_access)
    end

    it "can access assets in this project" do
      get :show, id: asset.id
      response.body.should eql(File.read(path))
    end
  end

  context "user_without_access" do
    before do
      sign_in(:user, user_no_access)
    end

    it "cannot access assets in this project" do
      get :show, id: asset.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The asset you are looking for cannot be found.")
    end
  end
end
