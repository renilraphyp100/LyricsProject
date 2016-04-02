class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string  :comment
      t.integer :commentable_id
      t.string  :commentable_type
      t.timestamps null: false
    end
  end
  
  
  def up
    change_table :albums do |t|
      t.references :commentable, :polymorphic => true
    end
    change_table :songs do |t|
      t.references :commentable, :polymorphic => true
    end
  end

  def down
    change_table :albums do |t|
      t.remove_references :commentable, :polymorphic => true
    end
    change_table :songs do |t|
      t.references :commentable, :polymorphic => true
    end
  end
  
end
