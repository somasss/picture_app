class CreateFeeds < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.text :image
      t.string :content

      t.timestamps
    end
  end
end
