//app/models/.
def self .latest
	Product.order('updated_at desc').first
end

def index
	latest = Product.latest

	if stale?(etag: latest, last_modified: latest.updated_at.utc)
	end
end

//httpd
expires_in 10.minutes, public: true
<LocationMatch "^/assets/.*$">
Header unset Last-Modified
Header unset ETag
FileETag None
ExpiresActive On
ExpiresDefault "access plus 1 year"
</LocationMatch>

