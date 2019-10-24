class CreateOrgs < ActiveRecord::Migration[5.0]
  def change
    create_table :orgs do |t|
      t.string :name
      t.text :desc
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
