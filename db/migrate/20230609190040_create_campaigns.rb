# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.decimal :goal

      t.timestamps
    end
  end
end
