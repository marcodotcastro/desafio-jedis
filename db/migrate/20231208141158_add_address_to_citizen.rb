class AddAddressToCitizen < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :citizen
  end
end
