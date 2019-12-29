class Grids::Update < BrowserAction
  route do
    grid = GridQuery.find(grid_id)
    SaveGrid.update(grid, params) do |operation, grid|
      if operation.saved?
        flash.success = t("action.update_success")
        redirect Show.with(grid.id)
      else
        flash.failure = t("error.form_not_valid")
        html EditPage, operation: operation, grid: grid
      end
    end
  end
end
