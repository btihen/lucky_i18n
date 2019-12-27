class Grids::New < BrowserAction
  route do
    html NewPage, operation: SaveGrid.new
  end
end
