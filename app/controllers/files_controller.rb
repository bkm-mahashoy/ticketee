class FilesController < ApplicationController

  before_filter :authenticate_user!

  def new
    @ticket = Ticket.new
    asset = @ticket.assets.build
    render partial: "files/form",
           locals: { file_number: params[:file_number].to_i,
                     asset: asset }
  end

  def show
    asset = Asset.find(params[:id])

    if can?(:view, asset.ticket.project) || current_user.admin?
      send_file asset.asset.path, filename: asset.asset_file_name,
                                  content_type: asset.asset_content_type
    else
      flash[:alert] = "The asset you are looking for cannot be found."
      redirect_to(root_path)
    end
  end
end
