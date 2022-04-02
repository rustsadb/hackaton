# frozen_string_literal: true

class AddRegistartionFiledsToUser < ActiveRecord::Migration[6.1]
  def up
    execute <<~SQL.squish
      CREATE TYPE genders AS ENUM (
        'male', 'female'
      );
    SQL

    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :gender, :genders
  end

  def down
    remove_column :users, :name
    remove_column :users, :email
    remove_column :users, :gender

    execute 'DROP TYPE genders'
  end
end
