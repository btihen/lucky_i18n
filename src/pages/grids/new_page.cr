class Grids::NewPage < MainLayout
  needs operation : SaveGrid
  quick_def page_title, t("action.new")

  def content
    h1 t("action.new")
    render_grid_form(@operation)
  end

  def render_grid_form(op)
    form_for Grids::Create do
      mount Shared::Field.new(op.rows), &.text_input(autofocus: "true")
      mount Shared::Field.new(op.cols)

      submit t("action.save"), data_disable_with: t("action.saving")
    end
  end
end
