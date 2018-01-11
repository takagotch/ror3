class Article
attr_reader :body

def initialize(body)
	@body = body
end

def self.find_recent
	[ new("#{Time.now.to_s}"),
	  new(""),
	  new(""),
	  new("") ]
end

end

