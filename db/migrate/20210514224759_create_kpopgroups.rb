class CreateKpopgroups < ActiveRecord::Migration[6.1]
  def change
    create_table :kpopgroups do |t|
      t.string :name
      t.integer :members
      t.string :label
      t.string :group_type

      t.timestamps
    end
  end
end
