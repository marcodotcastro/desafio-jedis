class AddCpfCnsEtcToCitizen < ActiveRecord::Migration[7.0]
  def change
    add_column :citizens, :cpf, :string
    add_column :citizens, :cns, :string
    add_column :citizens, :email, :string
    add_column :citizens, :birthday, :date
    add_column :citizens, :phone, :string
    add_column :citizens, :active, :boolean, default: true
  end
end
