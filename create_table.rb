create :tickets, options: "auto_increment = 10000" do |t|
	t.text :description
	t.timestamps
end

CREATE TABLE "tickets" (
"id" int(11) default null auto_increment primary key,
"description" text,
"created_at" datetime,
"updated_at" datetime,
)auto_increment = 10000;

