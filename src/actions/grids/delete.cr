class Grids::Delete < BrowserAction
  route do
    GridQuery.find(grid_id).delete
    flash.success = "Deleted the record"
    redirect Index
  end
end
