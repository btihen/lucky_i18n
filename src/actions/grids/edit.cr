class Grids::Edit < BrowserAction
  route do
    grid = GridQuery.find(grid_id)
    html EditPage,
      operation: SaveGrid.new(grid),
      grid: grid
  end
end
