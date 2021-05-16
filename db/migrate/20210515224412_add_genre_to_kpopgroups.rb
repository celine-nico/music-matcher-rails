class AddGenreToKpopgroups < ActiveRecord::Migration[6.1]
  def change
    add_column :kpopgroups, :genre, :string
  end
end
