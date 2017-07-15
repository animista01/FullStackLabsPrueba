class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.text :costumer_message
      t.integer :costumer_id
      t.text :support_agent_response
      t.integer :support_agent_id
      t.boolean :status
      t.datetime :closed_at

      t.timestamps null: false
    end
  end
end
