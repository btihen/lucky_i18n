class Grids::IndexPage < MainLayout
  needs grids : GridQuery
  quick_def page_title, "All"

  def content
    h1 "All Grids"
    link "New Grid", to: Grids::New
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
