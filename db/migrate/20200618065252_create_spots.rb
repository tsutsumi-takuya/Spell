class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|

		t.integer :user_id
    	t.string :spot_id
    	t.string :spot_name
    	t.text :caption
    	t.text :address
      	t.string :spot_image_id

      	t.timestamps

	end
  end
end
