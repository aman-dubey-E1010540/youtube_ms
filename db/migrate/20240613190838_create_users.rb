class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.text :name
      t.string :email
      t.date :dob

      t.timestamps
    end
  end
end


# def up def down