class CreatePurcahseHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :purcahse_histories do |t|

      t.timestamps
    end
  end
end
