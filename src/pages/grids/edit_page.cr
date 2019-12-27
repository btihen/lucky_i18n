class Grids::EditPage < MainLayout
  needs operation : SaveGrid
  needs grid : Grid
  quick_def page_title, "Edit"

  def content
    h1 "Edit"
    render_grid_form(@operation)
  end

  def render_grid_form(op)
    form_for Grids::Update.with(@grid.id) do
      mount Shared::Field.new(op.rows), &.text_input(autofocus: "true")
      mount Shared::Field.new(op.cols)

      submit "Update", data_disable_with: "Updating..."
    end
  end
end
