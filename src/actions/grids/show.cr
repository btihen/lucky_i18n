class Grids::Show < BrowserAction
  route do
    html ShowPage, grid: GridQuery.find(grid_id)
  end
end
