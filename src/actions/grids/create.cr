class Grids::Create < BrowserAction
  route do
    SaveGrid.create(params) do |operation, grid|
      if grid
        flash.success = t("action.save_success")
        redirect Show.with(grid.id)
      else
        flash.failure = t("error.form_not_valid")
        html NewPage, operation: operation
      end
    end
  end
end
