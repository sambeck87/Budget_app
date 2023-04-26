# frozen_string_literal: true

class CreateJoinTableEntitiesGroups < ActiveRecord::Migration[7.0]
  def change
    create_join_table :entities, :groups do |t|
      t.index %i[entity_id group_id]
      # t.index [:group_id, :entity_id]
    end
  end
end
