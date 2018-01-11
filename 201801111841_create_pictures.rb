#/views/migrate/.
class CreatePictures < ActiveRecord::Migration
  def change
	  t.string :comment
	  t.string :name
	  t.string :content_type

	  t.binary :data, :limit => 1.megabyte
  end
end

