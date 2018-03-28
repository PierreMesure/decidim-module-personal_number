# frozen_string_literal: true

class AddPersonalNumberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :decidim_users, :personal_number, :string
  end
end
