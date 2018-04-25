defmodule Graphical.Repo.Migrations.ModifyTokenTypes do
  use Ecto.Migration

  def change do
    alter table(:users) do
      modify :token, :text
    end
  end
end
