class Grids::Create < BrowserAction
  route do
    SaveGrid.create(params) do |operation, grid|
      if grid
        flash.success = "The record has been saved"
        redirect Show.with(grid.id)
      else
        flash.failure = "It looks like the form is not valid"
        html NewPage, operation: operation
      end
    end
  end
end
