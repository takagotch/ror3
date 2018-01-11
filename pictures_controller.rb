class PictureController < ApplicationController
validates_format_of :content_type,
	with: /^image/,
	message: "msg"

def uploaded_picture=(picture_field)
	self.name         = base_part_of(picture_field_original_filename)
	self.content_type = picture_field.content_type.chomp
	self.data         = picture_field.read
end

def base_part_of(file_name)
	File.basename(file_name).gsub(/[^\w._-]/, '')
end

def create
	@picture = Picture.new(params[:picture])
	if @picture.save
		redirect_to(@picture)
	else
		render(action: :new)
	end
end

def download
	@picture = Picture.find(params[:picture_id])
	send_data(@picuture.data,
		  filename: @picture.name,
		  type: @picture.content_type,
		 disposition: "inline")
end

def show
	@picture = Picute.find(params[:id])
end

end

