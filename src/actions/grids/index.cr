class Grids::Index < BrowserAction
  route do
    html IndexPage, grids: GridQuery.new
  end
end
