require "rubygems"
equire "active_record"

ActiveRecord::Base.establish_connection(:adapter => "sqlite3",
					:database => "db/development.sqlite3")

class Order < ActiveRecord::Base
end

order = Order.find(1)
order.name = "taka"
order.save

require "config/environment.rb"
order = Order.find(1)
order.name = "taka"
order.save

Array
CGI
Class
Date
Enumerable
File
Float
Hash
Interger
Kernel
Module
Numeric
Object
String
Time

BasicObject
Benchmarkable
Cache::Store
Callbacks
Concern,Dependencies
Configurable
Deprecation
Duration
Gzip
HashWithIndifferentAccess
Infilections
JSON
LazyLaodHooks
MessageEncryptor
MessageVerifier
MultiBuyte
Notification
OptionMerger
OrderedHash, OrderedOptions
Rescueable
StringInquirer
TestCase
Time, TimeWithZone

require "rubygems"
require "active_suport/time"
require "active_view/helpers"
Time.zone = 'Eastern Time (US & Canada)'
puts Time.zone.now

include ActiveView/helpers
puts distance_of_time_in_words_to_now(Time.parse("December 25"))

