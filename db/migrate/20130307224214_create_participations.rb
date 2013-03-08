class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.integer :participant_id
      t.integer :project_id

      t.timestamps
    end

    add_index :participations, :participant_id
    add_index :participations, :project_id
    add_index :participations, [:participant_id, :project_id], unique: true

  end
end
