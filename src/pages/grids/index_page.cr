class Grids::IndexPage < MainLayout
  needs grids : GridQuery
  quick_def page_title, t("action.index_title")

  def content
    h1 t("action.index_title")
    link t("action.create_new"), to: Grids::New
    render_grids
  end

  def render_grids
    ul do
      @grids.each do |grid|
        li do
          link grid.rows, Grids::Show.with(grid)
        end
      end
    end
  end
end
