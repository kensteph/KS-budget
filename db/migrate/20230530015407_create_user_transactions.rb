class CreateUserTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_transactions do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: 'users' }
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
