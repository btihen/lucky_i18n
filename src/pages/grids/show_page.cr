class Grids::ShowPage < MainLayout
  needs grid : Grid
  quick_def page_title, "#{@grid.rows} x #{@grid.cols}"

  def content
    link "Back to all Grids", Grids::Index
    h1 @grid.rows
    render_actions
    render_grid_fields
  end

  def render_actions
    section do
      link "Edit", Grids::Edit.with(@grid.id)
      text " | "
      link "Delete",
        Grids::Delete.with(@grid.id),
        data_confirm: "Are you sure?"
    end
  end

  def render_grid_fields
    ul do
      li do
        text "rows: "
        strong @grid.rows.to_s
      end
      li do
        text "cols: "
        strong @grid.cols.to_s
      end
    end
  end
end
