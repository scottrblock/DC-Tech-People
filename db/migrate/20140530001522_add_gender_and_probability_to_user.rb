class AddGenderAndProbabilityToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :probability, :float
  end
end
