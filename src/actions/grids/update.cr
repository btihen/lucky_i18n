class Grids::Update < BrowserAction
  route do
    grid = GridQuery.find(grid_id)
    SaveGrid.update(grid, params) do |operation, grid|
      if operation.saved?
        flash.success = "The record has been updated"
        redirect Show.with(grid.id)
      else
        flash.failure = "It looks like the form is not valid"
        html EditPage, operation: operation, grid: grid
      end
    end
  end
end
