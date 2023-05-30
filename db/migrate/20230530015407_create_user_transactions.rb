class CreateUserTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :user_transactions do |t|
      t.bigint :author_id
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
