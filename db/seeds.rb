#Events Categories
[
	{:name => "Multi-purpose Hall"},
	{:name => "Garden"},
	{:name => "Conference Center"},
	{:name => "Field"},
	{:name => "Auditorium"},
	{:name => "Civic Center"},
	{:name => "Pool Side"},
	{:name => "Open Lawn"},
	{:name => "Open Space"},
	{:name => "Hotel Event Hall"},
	{:name => "Club Hall"},
	{:name => "Marquee"}
].each do |param|
	Category.find_or_create_by(param)
end

#Configuration Settings
[
	{:config_key => "ManagerLogin"			,:config_value => true}
].each do |param|
	Setting.find_or_create_by(param)
end

#Demo Venue Lists
# [
# 	{"name" => "Yard 158 Grace Dome", "state_id" => 24, "local_govt_area_id" => 10, "address" => "", "phone" => "07063317344", "event_type_id" => 2, "capacity" => "1600", "price" => "1150000", "	user_id" => 1, "about" => "Welcome to Yard 158 A superior multipurpose events venue offering outstanding facilities services located in the heart of Ikeja, capital city of Lagos.Positioned on approximately 5 acres of land, it is the largest private arena in Nigeria unmatched for versatility, security and convenience. A space so flexible that whether your event is a small party or an international trade show, a grand ball or a rodeo, an open air crusade or cocktail, it provides the ideal platform for people to meet and interact"},
# 	{"name" => "Celebration Garden International Hall", "state_id" => 20, "local_govt_area_id" => 10, "address" => "", "phone" => "08033892189", "event_type_id" => 5, "capacity" => "550", "price" => "400000", "	user_id" => 1, "about" => "It is a decent hall located in Ikeja"},
# 	{"name" => "Zaaz Event Hall", "state_id" => 10, "local_govt_area_id" => 5, "address" => "", "phone" => "07090213344", "event_type_id" => 3, "capacity" => "150", "price" => "150000", "	user_id" => 1, "about" => "Suitable for small events"},
# 	{"name" => "Best Western Starfire Dukeyork Hall", "state_id" => 20, "local_govt_area_id" => 3, "address" => "", "phone" => "08029215033", "event_type_id" => 5, "capacity" => "1300", "price" => "100000", "	user_id" => 1, "about" => "Suitable for corporate events."},
# 	{"name" => "De Renaissance Event Hall", "state_id" => 18, "local_govt_area_id" => 8, "address" => "", "phone" => "08029666633", "event_type_id" => 1, "capacity" => "200", "price" => "250000", "	user_id" => 1, "about" => "The Venue is stylishly tucked within the serene environment of Alausa district, close to the Lagos state secretariat, Governors office Ikeja, the golf course is a 10mins drive from the hotel and therefore guarantees easy access to major parts of Lagos. The venue is a 15 minutes drive from the Muritala Mohammed international airport and 10minutes from MMA2. Also, next to the venue is the new Ultra Modern Shopping mall with shops like Shopprite, Woolworth, Mr. Price, Tru Worths, Genibendi, Ruff tumble for children naming just a few"},				
# ].each do |param|
# 	Venue.find_or_create_by(param)
# end