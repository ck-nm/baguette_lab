class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :public_id
      t.string  :title
      t.text    :opinion
      t.timestamps
    end
  end
end
