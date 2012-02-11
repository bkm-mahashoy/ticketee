module Admin::PermissionsHelper

  def permissions
    {
      "view" => "View",
      "create ticket" => "Create Tickets",
      "edit ticket" => "Edit Tickets",
      "delete ticket" => "Delete Tickets",
      "change state" => "Change States"
    }
  end
end
