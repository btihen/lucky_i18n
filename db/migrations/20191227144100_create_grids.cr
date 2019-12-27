class CreateGrids::V20191227144100 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(Grid) do
      primary_key id : Int64
      add_timestamps
      add rows : Int32
      add cols : Int32
    end
  end

  def rollback
    drop table_for(Grid)
  end
end
