module Admin::PermissionsHelper

  def permissions
    {
      "view" => "View",
      "create ticket" => "Create Tickets",
      "edit ticket" => "Edit Tickets",
      "delete ticket" => "Delete Tickets"
    }
  end
end
