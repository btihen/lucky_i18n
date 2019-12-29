class Grids::Delete < BrowserAction
  route do
    GridQuery.find(grid_id).delete
    flash.success = t("action.delete_success")
    redirect Index
  end
end
