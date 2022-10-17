create database order_management_system;

use order_management_system;

# Createing tables for order_management_system
create table if not exists Customer(
	Customer_ID int not null auto_increment,
    FName varchar(40) not null,
    LName varchar(40) not null,
    Address varchar(100) not null,
    Email varchar(40) not null,
    Phone varchar(20) not null,
    primary key (Customer_ID),
    unique (Email),
    unique (Phone)
);

create table if not exists Supplier(
	Supplier_ID int not null auto_increment,
    CompanyName varchar(40) not null,
    Address varchar(100) not null,
    Phone varchar(20) not null,
    Email varchar(40) not null,
    Fax varchar(8),
    OtherDetails varchar(100),
    primary key (Supplier_ID),
    unique (Phone),
    unique (Email),
    unique (Fax)
);

create table if not exists Product(
	Product_ID int not null auto_increment,
    ProductName varchar(100) not null,
    ProductDesc varchar(40) not null,
    Discount float not null,
    OtherDetails varchar(100),
    Supplier_ID int not null,
    primary key (Product_ID),
    foreign key (Supplier_ID) references Supplier(Supplier_ID) match simple
    on update cascade
    on delete cascade
);

create table if not exists Category(
	Category_ID int not null auto_increment,
    CategoryPrice float not null,
    CategoryColor varchar(10) not null,
    CategoryQuantity int not null,
    Product_ID int not null,
    primary key (Category_ID),
    foreign key (Product_ID) references Product(Product_ID) match simple
    on update cascade
    on delete cascade
);

create table if not exists Orders(
	Order_ID int not null auto_increment,
    DateOfOrder date not null,
    Customer_ID int not null,
    primary key (Order_ID),
    foreign key (Customer_ID) references Customer(Customer_ID) match simple
    on update cascade
    on delete cascade
);

create table if not exists Payment(
	Bill_ID int not null auto_increment,
    PaymentType varchar(40) not null,
    Complete tinyint default(0),
    TotalAmt float not null,
    primary key (Bill_ID)
);

create table if not exists OrderDetails(
	OrderDetail_ID int not null auto_increment,
    UnitPrice float not null,
    Quantity int not null,
    Discount float not null,
    DateofOrder date default(CURRENT_DATE),
    Category_ID int not null,
    Order_ID int not null,
    Bill_ID int not null,
    primary key (OrderDetail_ID),
    foreign key (Category_ID) references Category(Category_ID) match simple
    on update cascade
    on delete cascade,
    foreign key (Order_ID) references Orders(Order_ID) match simple
    on update cascade
    on delete cascade,
    foreign key (Bill_ID) references Payment(Bill_ID) match simple
    on update cascade
    on delete cascade
);

create table if not exists Exchange(
	Exchange_ID int not null auto_increment,
    OrderDetail_ID int not null,
    Category_ID int not null,
    ChangeQuantity int not null,
    NewAmt float not null,
    Bill_ID int not null,
    primary key (Exchange_ID),
    foreign key (OrderDetail_ID) references OrderDetails(OrderDetail_ID) match simple
    on update cascade
    on delete cascade,
    foreign key (Bill_ID) references Payment(Bill_ID) match simple
    on update cascade
    on delete cascade,
    foreign key (Category_ID) references Category(Category_ID) match simple
    on update cascade
    on delete cascade
);

create table if not exists Returns(
	Return_ID int not null auto_increment,
    OrderDetail_ID int not null,
    ReturnReqDate date not null,
    primary key (Return_ID),
    foreign key (OrderDetail_ID) references OrderDetails(OrderDetail_ID) match simple
    on update cascade
    on delete cascade
);

insert into Customer (FName, LName, Address, Phone, Email) values 
('Yurik' , 'Guidera' , '51902 Ludington Court' , '8185043979' , 'yguidera0@a8.net'),
('Liuka' , 'Moughtin' , '42248 Novick Lane' , '5578814590' , 'lmoughtin1@sourceforge.net'),      
('Annabell' , 'Zapata' , '51706 Macpherson Junction' , '4083379965' , 'azapata2@friendfeed.com'),
('Ewell' , 'Fearguise' , '06881 Montana Trail' , '3184705487' , 'eofearguise3@cbc.ca'),        
('Amaleta' , 'Eccott' , '83066 Havey Court' , '7172087352' , 'aeccott4@chron.com'),
('Stepha' , 'Gobert' , '06 Buell Drive' , '7104314474' , 'sgobert5@sbwire.com'),
('Germain' , 'Geill' , '35 Sunfield Plaza' , '9563648350' , 'ggeill6@ca.gov'),
('Merlina' , 'Cisson' , '579 Washington Street' , '9341024014' , 'mcisson7@imageshack.us'),      
('Karrah' , 'Murdy' , '11 Riverside Court' , '6255589839' , 'kmurdy8@newyorker.com'),
('Barnaby' , 'MacCarlich' , '6 Grasskamp Hill' , '3113097255' , 'bmaccarlich9@soup.io'),
('Louella' , 'Pettegre' , '900 Butternut Park' , '7792715595' , 'lpettegrea@sogou.com'),
('Aleksandr' , 'Ensten' , '3 Spaight Street' , '8488640071' , 'aenstenb@constantcontact.com'),   
('Ogdon' , 'Nund' , '8 Welch Crossing' , '5196800174' , 'onundc@bizjournals.com'),
('Beltran' , 'Blacklock' , '240 New Castle Court' , '4842479854' , 'bblacklockd@biblegateway.com'),
('Rosamond' , 'Linne' , '02 Acker Hill' , '8087310529' , 'rlinnee@huffingtonpost.com'),
('Norah' , 'Brunsdon' , '212 Village Green Parkway' , '8614865694' , 'nbrunsdonf@surveymonkey.com'),
('Chrystel' , 'Pickersail' , '5 Cordelia Avenue' , '1015005250' , 'cpickersailg@biblegateway.com'),
('Pernell' , 'Naisey' , '1 John Wall Place' , '7357893528' , 'pnaiseyh@over-blog.com'),
('Hedvig' , 'Dickerson' , '53690 Laurel Street' , '3999641191' , 'hdickersoni@newsvine.com'),
('Venita' , 'Kuzemka' , '100 North Pass' , '4875000456' , 'vkuzemkaj@dagondesign.com'),
('Marty' , 'Player' , '16 Westridge Junction' , '6802447436' , 'mplayerk@networkadvertising.org'),
('Melissa' , 'Gray' , '51341 Kenwood Road' , '9704978801' , 'mgrayl@bandcamp.com'),
('Hort' , 'Squire' , '1606 Hudson Terrace' , '5654724815' , 'hsquirem@nasa.gov'),
('Adlai' , 'Dighton' , '212 Maywood Park' , '4139056189' , 'adightonn@biglobe.ne.jp'),
('Judye' , 'Wodham' , '88 Anhalt Pass' , '5488665697' , 'jwodhamo@house.gov'),
('Saunder' , 'Beyn' , '992 Badeau Parkway' , '6548268628' , 'sbeynp@umich.edu'),
('Fransisco' , 'Scurrell' , '10660 Kropf Circle' , '2004030885' , 'fscurrellq@dedecms.com'),
('Hasheem' , 'Kingsnoad' , '59670 Blaine Hill' , '8761285130' , 'hkingsnoadr@cmu.edu'),
('Gearalt' , 'Elderton' , '440 Portage Point' , '3317698825' , 'geldertons@privacy.gov.au'),
('Eustace' , 'Bramble' , '9803 Harbort Parkway' , '3227104221' , 'ebramblet@sina.com.cn'),
('Ingrim' , 'Ficken' , '76957 Kings Court' , '6768697080' , 'ifickenu@stumbleupon.com'),
('Aloin' , 'Yashaev' , '8 Pond Circle' , '8081503726' , 'ayashaevv@seattletimes.com'),
('Horton' , 'Durand' , '554 Lindbergh Circle' , '6949897381' , 'hdurandw@mysql.com'),
('Holly' , 'Keggin' , '98737 Burrows Court' , '8849249127' , 'hkegginx@utexas.edu'),
('Zacharias' , 'Buntin' , '71 Karstens Center' , '1015099761' , 'zbuntiny@google.com.au'),
('Samuele' , 'Wisby' , '766 Gateway Court' , '3016396196' , 'swisbyz@stanford.edu'),
('Chelsey' , 'Johanning' , '2804 Northland Alley' , '8628471245' , 'cjohanning10@desdev.cn'),
('Talbert' , 'Pratten' , '6914 Summit Point' , '5602441044' , 'tpratten11@sitemeter.com'),
('Aigneis' , 'Belamy' , '94171 Duke Alley' , '2356124508' , 'abelamy12@cafepress.com'),
('Andreana' , 'Vanner' , '7 Rusk Pass' , '6992469284' , 'avanner13@mlb.com'),
('Annemarie' , 'Duncklee' , '8430 Bayside Plaza' , '6154200426' , 'aduncklee14@tripadvisor.com'),
('Brose' , 'Biesty' , '69884 Eastwood Junction' , '2089669320' , 'bbiesty15@drupal.org'),
('Arthur' , 'McCarty' , '54 Eagan Trail' , '9499352066' , 'amccarty16@over-blog.com'),
('Win' , 'Langmuir' , '2 Browning Parkway' , '2365290313' , 'wlangmuir17@cpanel.net'),
('Eustace' , 'Mixture' , '5842 Golden Leaf Center' , '3956868050' , 'emixture18@usgs.gov'),
('Arielle' , 'Greenshields' , '37 Maryland Trail' , '5969090426' , 'agreenshields19@bloglines.com'),
('Tallou' , 'Pammenter' , '1 Kropf Park' , '4703944003' , 'tpammenter1a@home.pl'),
('Meade' , 'Graysmark' , '5 Lukken Junction' , '6899554521' , 'mgraysmark1b@php.net'),
('Berry' , 'Watman' , '80 Parkside Terrace' , '7052381702' , 'bwatman1c@time.com'),
('Herold' , 'Shovell' , '4292 Crownhardt Hill' , '6834768033' , 'hshovell1d@artisteer.com');

insert into Supplier (CompanyName, Address, Phone, Email, Fax, OtherDetails) values
('Jaxnation' , '63 Larry Pass' , '6712488999' , 'jsmedmoor0@miibeian.gov.cn' , '37199223' , 'Another Address: 26384 Altenwerth Lake South Selina, AL 54508'),
('Divavu' , '667 Marcy Court' , '1575513646' , 'bmacmenamy1@nature.com' , '94591106' , NULL),
('Edgetag' , '69609 Ridge Oak Parkway' , '5885154189' , 'lgonnet2@vinaora.com' , NULL , NULL),
('Lajo' , '8 Thierer Circle' , '3506378334' , 'djouannin3@house.gov' , NULL , NULL),
('Zooxo' , '3968 Oxford Place' , '3887112875' , 'kgann4@hud.gov' , NULL , NULL),
('Fivespan' , '92 Dunning Center' , '2684811407' , 'tcromwell5@de.vu' , '67196105' , 'Another Number: 7706654607'),
('Tagtune' , '82 Packers Drive' , '6098764832' , 'spolin6@marketwatch.com' , '17318423' , NULL),
('Vipe' , '92652 Victoria Center' , '7987273377' , 'hpiper7@meetup.com' , '59739376' , NULL),
('Chatterpoint' , '39451 Center Crossing' , '5627953965' , 'kbuddington8@so-net.ne.jp' , NULL , NULL),
('Kayveo' , '9 Anzinger Alley' , '6224399462' , 'alannen9@jalbum.net' , NULL , NULL),
('Meetz' , '2 Farmco Center' , '5465166249' , 'jjouannina@jiathis.com' , NULL , 'None'),
('Skyndu' , '4 Pennsylvania Street' , '4893694671' , 'ekirtleyb@cdc.gov' , NULL , NULL),
('Rhycero' , '938 Merry Circle' , '2697588606' , 'cnunneryc@tuttocitta.it' , NULL , NULL),
('Mudo' , '244 Superior Pass' , '2396099137' , 'clefwichd@ebay.co.uk' , NULL , NULL),
('Feedmix' , '5756 Coleman Drive' , '3737758210' , 'mcopoe@mit.edu' , NULL , NULL);

insert into Product (ProductName, Discount, Supplier_ID, ProductDesc, OtherDetails) values
('Mazda6' , '0.77' , '15' , 'speed - 179, fuel - 9' , 'Inspired from Formula-1 cars'),
('CR-V' , '4.71' , '1' , 'speed - 151, fuel - 7' , NULL),
('CL-Class' , '4.99' , '9' , 'speed - 114, fuel - 9' , NULL),
('Vantage' , '2.66' , '9' , 'speed - 183, fuel - 9' , NULL),
('Nano' , '1.32' , '14' , 'speed - 168, fuel - 5' , NULL),
('Crown Victoria' , '1.71' , '13' , 'speed - 109, fuel - 5' , NULL),
('Tahoe' , '1.0' , '9' , 'speed - 162, fuel - 7' , NULL),
('Caprice' , '4.43' , '11' , 'speed - 191, fuel - 10' , NULL),
('Tiburon' , '3.15' , '5' , 'speed - 171, fuel - 6' , NULL),
('Continental Flying Spur' , '3.35' , '12' , 'speed - 177, fuel - 10' , NULL),
('G37' , '3.88' , '1' , 'speed - 151, fuel - 6' , NULL),
('Savana 2500' , '1.31' , '9' , 'speed - 138, fuel - 6' , NULL),
('Aero 8' , '3.48' , '9' , 'speed - 184, fuel - 10' , 'SuperFast Speed coverage'),
('Defender 90' , '2.52' , '10' , 'speed - 127, fuel - 10' , NULL),
('Grand Am' , '1.42' , '5' , 'speed - 146, fuel - 5' , NULL),
('Avalanche' , '1.91' , '11' , 'speed - 130, fuel - 6' , NULL),
('Galant' , '1.96' , '4' , 'speed - 174, fuel - 8' , NULL),
('Skylark' , '3.18' , '5' , 'speed - 146, fuel - 5' , NULL),
('Century' , '4.61' , '6' , 'speed - 158, fuel - 6' , NULL),
('M6' , '2.12' , '2' , 'speed - 160, fuel - 10' , NULL),
('MKS' , '0.84' , '3' , 'speed - 119, fuel - 6' , NULL),
('Pajero' , '2.22' , '1' , 'speed - 170, fuel - 6' , NULL),
('Avenger' , '2.15' , '1' , 'speed - 157, fuel - 6' , NULL),
('Riviera' , '4.96' , '9' , 'speed - 167, fuel - 10' , 'Book today. Cars for you'),
('Avalon' , '4.03' , '14' , 'speed - 111, fuel - 5' , NULL),
('Escape' , '1.75' , '10' , 'speed - 165, fuel - 5' , NULL),
('Mentor' , '2.95' , '14' , 'speed - 108, fuel - 10' , NULL),
('Hombre Space' , '3.91' , '1' , 'speed - 123, fuel - 6' , NULL),
('Aztek' , '3.72' , '4' , 'speed - 128, fuel - 9' , NULL),
('Space' , '4.38' , '5' , 'speed - 116, fuel - 9' , NULL);

insert into Category (CategoryPrice , CategoryQuantity, Product_ID , CategoryColor) values
('3580142' , '406' , '23' , 'Turquoise'),
('1317656' , '247' , '24' , 'Red'),
('3129700' , '276' , '4' , 'Red'),
('3204762' , '453' , '9' , 'Aquamarine'),
('3020456' , '347' , '19' , 'Fuscia'),
('2002190' , '56' , '27' , 'Khaki'),
('3343637' , '410' , '6' , 'Mauv'),
('4714508' , '380' , '2' , 'Teal'),
('2343593' , '136' , '15' , 'Aquamarine'),
('1308644' , '416' , '12' , 'Orange'),
('3054986' , '284' , '26' , 'Indigo'),
('4346506' , '142' , '12' , 'Violet'),
('640788' , '447' , '21' , 'Violet'),
('1034842' , '457' , '27' , 'Turquoise'),
('928127' , '477' , '20' , 'Puce'),
('1011654' , '59' , '6' , 'Orange'),
('2768047' , '320' , '6' , 'Orange'),
('1632971' , '267' , '16' , 'Goldenrod'),
('844371' , '433' , '25' , 'Crimson'),
('2274875' , '270' , '14' , 'Orange'),
('2973991' , '388' , '6' , 'Pink'),
('2801441' , '339' , '8' , 'Aquamarine'),
('2384679' , '255' , '7' , 'Aquamarine'),
('867683' , '340' , '19' , 'Pink'),
('4118678' , '457' , '23' , 'Crimson'),
('4927320' , '155' , '11' , 'Mauv'),
('2836460' , '326' , '4' , 'Pink'),
('566824' , '263' , '1' , 'Khaki'),
('4899977' , '488' , '4' , 'Fuscia'),
('4950927' , '326' , '19' , 'Fuscia'),
('721269' , '263' , '18' , 'Maroon'),
('1906236' , '196' , '20' , 'Indigo'),
('4869641' , '212' , '9' , 'Red'),
('2811548' , '407' , '23' , 'Pink'),
('4649343' , '378' , '20' , 'Maroon'),
('2712165' , '257' , '11' , 'Green'),
('1227555' , '149' , '30' , 'Yellow'),
('2588880' , '199' , '10' , 'Fuscia'),
('4724622' , '235' , '25' , 'Orange'),
('4793679' , '271' , '11' , 'Green'),
('3117257' , '192' , '27' , 'Purple'),
('1957149' , '197' , '20' , 'Crimson'),
('3418613' , '154' , '20' , 'Aquamarine'),
('1811072' , '192' , '11' , 'Maroon'),
('3425744' , '237' , '26' , 'Aquamarine'),
('2652604' , '191' , '1' , 'Khaki'),
('3483051' , '485' , '3' , 'Indigo'),
('705635' , '63' , '27' , 'Mauv'),
('3093666' , '84' , '5' , 'Purple'),
('4003724' , '182' , '24' , 'Orange');

insert into Orders (DateOfOrder, Customer_ID) values
('2022-02-24' , '50') , 
('2021-12-14' , '3') ,
('2022-02-03' , '37') ,
('2022-01-19' , '22') ,
('2022-06-20' , '26') ,
('2022-06-08' , '47') ,
('2022-03-12' , '15') ,
('2022-04-28' , '7') ,
('2021-08-09' , '25') ,
('2022-06-03' , '22') ,
('2021-12-28' , '44') ,
('2022-02-21' , '45') ,
('2021-09-03' , '31') ,
('2022-02-04' , '22') ,
('2021-12-14' , '36') ,
('2021-08-20' , '29') ,
('2022-02-25' , '24') ,
('2021-08-09' , '13') ,
('2021-12-30' , '36') ,
('2021-11-03' , '15') ,
('2022-07-20' , '32') ,
('2021-11-03' , '46') ,
('2021-10-30' , '45') ,
('2022-01-25' , '42') ,
('2022-04-20' , '5') ,
('2022-05-23' , '36') ,
('2021-12-19' , '21') ,
('2022-02-09' , '35') ,
('2022-03-01' , '28') ,
('2022-07-06' , '16');

insert into Payment (PaymentType, Complete, TotalAmt) values
('Cash On Delivery' , '1' , '6555999'),
('UPI' , '1' , '6555999'),
('Cash On Delivery' , '1' , '1601781'),
('Cash On Delivery' , '1' , '5773543'),
('DebitCard' , '1' , '5773543'),
('Banking' , '1' , '4716247'),
('Banking' , '1' , '1495162'),
('Cash On Delivery' , '1' , '1495162'),
('UPI' , '1' , '12277782'),
('UPI' , '1' , '12277782'),
('UPI' , '1' , '12277782'),
('Banking' , '1' , '12277782'),
('DebitCard' , '1' , '2751100'),
('UPI' , '1' , '7692773'),
('DebitCard' , '1' , '7692773'),
('Cash On Delivery' , '1' , '1740802'),
('Cash On Delivery' , '1' , '635405'),
('Banking' , '1' , '2627944'),
('UPI' , '1' , '2627944'),
('Cash On Delivery' , '1' , '4492455'),
('UPI' , '1' , '3346138'),
('DebitCard' , '1' , '2310314'),
('CreditCard' , '1' , '9742159'),
('Banking' , '1' , '9742159'),
('DebitCard' , '1' , '9742159'),
('Banking' , '1' , '7328398'),
('DebitCard' , '1' , '7328398'),
('CreditCard' , '1' , '1372802'),
('CreditCard' , '1' , '1372802'),
('CreditCard' , '1' , '9755617'),
('UPI' , '1' , '9755617'),
('Banking' , '1' , '9755617');

insert into OrderDetails (Order_ID, Bill_ID , Quantity, Category_ID , UnitPrice , DateOfOrder, Discount) values
('1' , '1' , '2' , '49' , '3093666' , '2022-02-24' , '1.32' ),
('1' , '1' , '3' , '1' , '3580142' , '2022-02-24' , '2.15' ),
('2' , '2' , '3' , '18' , '1632971' , '2021-12-14' , '1.91' ),
('3' , '3' , '3' , '17' , '2768047' , '2022-02-03' , '1.71' ),
('3' , '3' , '1' , '49' , '3093666' , '2022-02-03' , '1.32' ),
('4' , '4' , '3' , '33' , '4869641' , '2022-01-19' , '3.15' ),
('5' , '5' , '2' , '48' , '705635' , '2022-06-20' , '2.95' ),
('5' , '5' , '3' , '19' , '844371' , '2022-06-20' , '4.03' ),
('6' , '6' , '1' , '13' , '640788' , '2022-06-08' , '0.84' ),
('6' , '6' , '2' , '35' , '4649343' , '2022-06-08' , '2.12' ),
('6' , '6' , '3' , '50' , '4003724' , '2022-06-08' , '4.96' ),
('6' , '6' , '3' , '7' , '3343637' , '2022-06-08' , '1.71' ),
('6' , '31' , '2' , '34' , '2811548' , '2022-06-08' , '2.15' ),
('7' , '7' , '1' , '29' , '4899977' , '2022-03-12' , '2.66' ),
('7' , '7' , '3' , '21' , '2973991' , '2022-03-12' , '1.71' ),
('8' , '8' , '2' , '44' , '1811072' , '2022-04-28' , '3.88' ),
('9' , '32' , '2' , '13' , '640788' , '2021-08-09' , '0.84' ),
('10' , '10' , '2' , '6' , '2002190' , '2022-06-03' , '2.95' ),
('10' , '10' , '1' , '48' , '705635' , '2022-06-03' , '2.95' ),
('11' , '11' , '1' , '8' , '4714508' , '2021-12-28' , '4.71' ),
('12' , '12' , '3' , '43' , '3418613' , '2022-02-21' , '2.12' ),
('13' , '13' , '1' , '9' , '2343593' , '2021-09-03' , '1.42' ),
('14' , '14' , '3' , '30' , '4950927' , '2022-02-04' , '4.61' ),
('14' , '14' , '2' , '4' , '3204762' , '2022-02-04' , '3.15' ),
('14' , '14' , '1' , '42' , '1957149' , '2022-02-04' , '2.12' ),
('15' , '15' , '3' , '17' , '2768047' , '2021-12-14' , '1.71' ),
('15' , '15' , '3' , '40' , '4793679' , '2021-12-14' , '3.88' ),
('16' , '16' , '3' , '19' , '844371' , '2021-08-20' , '4.03' ),
('16' , '16' , '1' , '28' , '566824' , '2021-08-20' , '0.77' ),
('17' , '17' , '1' , '8' , '4714508' , '2022-02-25' , '4.71' ),
('17' , '17' , '1' , '27' , '2836460' , '2022-02-25' , '2.66' ),
('17' , '17' , '3' , '38' , '2588880' , '2022-02-25' , '3.35' ),
('18' , '18' , '2' , '8' , '4714508' , '2021-08-09' , '4.71' ),
('19' , '19' , '3' , '11' , '3054986' , '2021-12-30' , '1.75' ),
('21' , '21' , '3' , '18' , '1632971' , '2022-07-20' , '1.91' ),
('21' , '21' , '1' , '2' , '1317656' , '2022-07-20' , '4.96' ),
('21' , '21' , '3' , '10' , '1308644' , '2022-07-20' , '1.31' ),
('22' , '22' , '3' , '20' , '2274875' , '2021-11-03' , '2.52' ),
('22' , '22' , '1' , '11' , '3054986' , '2021-11-03' , '1.75' ),
('23' , '23' , '2' , '16' , '1011654' , '2021-10-30' , '1.71' ),
('23' , '23' , '2' , '26' , '4927320' , '2021-10-30' , '3.88' ),
('23' , '23' , '3' , '37' , '1227555' , '2021-10-30' , '4.38' ),
('24' , '24' , '2' , '14' , '1034842' , '2022-01-25' , '2.95' ),
('25' , '25' , '1' , '9' , '2343593' , '2022-04-20' , '1.42' ),
('26' , '26' , '1' , '40' , '4793679' , '2022-05-23' , '3.88' ),
('27' , '27' , '3' , '10' , '1308644' , '2021-12-19' , '1.31' ),
('28' , '28' , '2' , '8' , '4714508' , '2022-02-09' , '4.71' ),
('29' , '29' , '3' , '49' , '3093666' , '2022-03-01' , '1.32' ),
('30' , '30' , '1' , '22' , '2801441' , '2022-07-06' , '4.43' ),
('30' , '30' , '2' , '36' , '2712165' , '2022-07-06' , '3.88' );

insert into Exchange (OrderDetail_ID, ChangeQuantity, NewAmt, Bill_ID , Category_ID) values
('13' , '2' , '2811548' , '31' , '34'),
('17' , '2' , '640788' , '32' , '13');

insert into Returns (OrderDetail_ID , ReturnReqDate) values
('5' , '2022-02-06'),
('48' , '2022-03-08');

select * from customer;
select * from supplier;
select * from product;
select * from category;
select * from payment;
select * from orders;
select * from orderdetails;
select * from returns;
select * from exchange;

select count(*) from customer;
select count(*) from supplier;
select count(*) from orders;
select count(*) from orderdetails;
select count(*) from product;
select count(*) from category;
select count(*) from payment;
select count(*) from returns;
select count(*) from exchange;

select sum(totalamt) from payment;

select distinct(paymenttype) from payment;

select * from payment where paymenttype = 'DebitCard';

select * from product where otherdetails is not NULL;

select productname from product where discount > 2;

select * from category where categoryquantity between 100 and 300;

select * from customer where fname like 'A%';

select * from orderdetails where quantity > 1 order by dateoforder limit 5;

select avg(totalamt) from payment where paymenttype = 'Banking';

select * from category where categoryquantity between 200 and 300 and categoryprice > 100000;

select paymenttype , avg(totalamt) from payment group by paymenttype order by paymenttype;

select paymenttype , count(paymenttype) as count from payment group by paymenttype order by count;

select * from orderdetails where dateoforder >= '2022-01-01' order by dateoforder;

select paymenttype from payment group by paymenttype having avg(totalamt) <= 6000000;

select * from customer where phone like '8%';

select * from (select * from category order by categoryprice desc limit 3) as cat order by categoryprice limit 1;

select * from orders join customer on customer.customer_id = orders.customer_id where customer.fname = 'Annabell';

select customer.fname, orders.dateoforder, orderdetails.unitprice, orderdetails.quantity, orderdetails.discount, orderdetails.category_id 
from orders join customer on customer.customer_id = orders.customer_id join orderdetails on orders.order_id = orderdetails.order_id 
where customer.fname = 'Annabell';

select * from orderdetails join orders on orders.order_id = orderdetails.order_id order by orders.order_id;

select customer.fname, customer.lname, returns.returnreqdate from customer join orders on orders.customer_id = customer.customer_id 
join orderdetails on orders.order_id = orderdetails.order_id join returns on orderdetails.orderdetail_id = returns.orderdetail_id;

select customer.fname, customer.lname, orderdetails.dateoforder from customer join orders on orders.customer_id = customer.customer_id 
join orderdetails on orders.order_id = orderdetails.order_id join exchange on orderdetails.orderdetail_id = exchange.orderdetail_id;

select customer.customer_id , customer.fname, customer.lname from customer join orders on orders.customer_id = customer.customer_id 
join orderdetails on orders.order_id = orderdetails.order_id join category on category.category_id = orderdetails.category_id 
where categorycolor = 'red';

select distinct(product.productname) from product join category on category.product_id = product.product_id 
join orderdetails on orderdetails.category_id = category.category_id join returns on returns.orderdetail_id = orderdetails.orderdetail_id;

select distinct(product.productname) from product join category on category.product_id = product.product_id 
join orderdetails on orderdetails.category_id = category.category_id join exchange on exchange.orderdetail_id = orderdetails.orderdetail_id;

select payment.paymenttype, payment.totalamt from orders join orderdetails on orders.order_id = orderdetails.order_id 
join payment on orderdetails.bill_id = payment.bill_id where orders.order_id = 21 group by payment.bill_id;

select paymenttype, count(paymenttype) as count from customer join orders on orders.customer_id = customer.customer_id join orderdetails on orders.order_id = orderdetails.order_id 
join payment on payment.bill_id = orderdetails.bill_id where customer.customer_id = 22 group by payment.bill_id;

select * from customer
where customer_id not in (select distinct(customer_id) from orders);

select * from product
where product_id not in (select distinct(product_id) from category);

create or replace view OrdersAndCustomers as select customer.customer_id, customer.fname, customer.lname, customer.email, 
customer.phone, orders.order_id, orders.dateoforder from customer join orders on customer.customer_id = orders.customer_id 
order by customer_id;
select * from ordersandcustomers;

create or replace view OrdersAndPayments as select orderdetails.orderdetail_id, orders.order_id, orderdetails.dateoforder, 
orderdetails.category_id, orderdetails.bill_id, orderdetails.unitprice, orderdetails.discount, orderdetails.quantity, payment.paymenttype, 
payment.totalamt from orders join orderdetails on orderdetails.order_id = orders.order_id join payment 
on payment.bill_id = orderdetails.bill_id order by orderdetail_id;
select * from ordersandpayments;

-- To learn in future triggers and functions