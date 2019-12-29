class AddLanguageToUser::V20191228100116 < Avram::Migrator::Migration::V1
  def migrate
    alter table_for(User) do
      add lang : String, default: "en"
    end
  end

  def rollback
    alter table_for(User) do
      remove :lang
    end
  end
end
