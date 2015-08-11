class ChangeTicketColumn < ActiveRecord::Migration
  def change
    rename_column :tickets, :type, :ticket_type
    rename_column :tickets, :price, :ticket_price
  end
end
