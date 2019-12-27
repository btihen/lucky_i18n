class Grids::NewPage < MainLayout
  needs operation : SaveGrid
  quick_def page_title, "New"

  def content
    h1 "New"
    render_grid_form(@operation)
  end

  def render_grid_form(op)
    form_for Grids::Create do
      mount Shared::Field.new(op.rows), &.text_input(autofocus: "true")
      mount Shared::Field.new(op.cols)

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
