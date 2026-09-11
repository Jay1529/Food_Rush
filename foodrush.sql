create database foodrush;
use foodrush;
show tables;

create table customers(
    customer_id int auto_increment primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) not null unique,
    address varchar(255),
    phone int(11) not null unique,
    registration_date date not null,
    cus_status varchar(20) default 'Active' );
    
    create table restaurants(
    restaurant_id int auto_increment primary key,
    owner_name varchar(200) not null,
    email varchar(100) not null unique,
    address varchar(255),
    phone int(11) not null unique,
    opening_time time,
    closing_time time);
    
    create table food_categories(
    categorie_id int auto_increment primary key,
    categorie_name varchar(200) not null unique);
    
    create table  delivery_partner(
    partner_id int auto_increment primary key,
    partner_name varchar(200) not null,
    phone int(11) not null,
    joining_date date,
    vechical_type varchar(50) not null,
    vechical_no varchar(30) not null unique,
    partner_status varchar(50) not null);
    
    create table coupons(
    coupon_id int auto_increment primary key,
    min_order_amount decimal(10,2),
    discount decimal(10,2),
    start_date date,
    end_date date );
    
    create table menu_items(
    item_id int auto_increment primary key,
    restaurant_id int not null,
    categorie_id int not null,
    item_name varchar(100) not null,
    price decimal(10,2) not null,
    foreign key(restaurant_id) references restaurants(restaurant_id),
    foreign key(categorie_id) references food_categories(categorie_id)); 
    
	create table orders(
    order_id int auto_increment primary key,
    customer_id int not null,
    restaurant_id int not null,
    partner_id int not null,
    order_date date,
    delivery_address varchar(200) not null,
    order_status varchar(50),
    total_cost decimal(10,2) not null,
	foreign key(customer_id) references customers(customer_id),
	foreign key(restaurant_id) references restaurants(restaurant_id),
    foreign key(partner_id) references delivery_partner(partner_id) );
    
    create table items(
    order_item_id int auto_increment primary key,
    order_id int not null,
    item_id int not null,
    quantity int not null,
    amount decimal(10,2) not null,
    foreign key(order_id) references orders(order_id),
    foreign key(item_id) references menu_items(item_id));
    
    create table reviews(
    review_id int auto_increment primary key,
    order_id int not null,
    customer_id int not null,
    restaurant_id int not null,
    ratng int not null,
    review_txt varchar(500),
    foreign key (order_id) references orders(order_id),
    foreign key (customer_id) references customers(customer_id),
    foreign key (restaurant_id) references restaurants(restaurant_id) );
    
	create table deliveries(
    delivery_id int auto_increment primary key,
    partner_id int not null,
    order_id int not null,
    assigned_id int not null,
    pickup_time time not null,
    delivery_time time not null,
    delivery_status varchar(150),
    foreign key (order_id) references orders(order_id),
    foreign key (partner_id) references delivery_partner(partner_id));
    
    create table payments(
    payment_id int auto_increment primary key,
    order_id int not null,
    payment_method varchar(100),
    amount decimal(10,2) not null,
    payment_status varchar(100) not null,
    foreign key (order_id) references orders(order_id));
    
    create table order_coupons(
    order_coupons_id int auto_increment primary key,
    order_id int not null,
    coupon_id int not null,
    discount_amount decimal(10,2) not null,
    foreign key (order_id) references orders(order_id),
    foreign key (coupon_id) references coupons(coupon_id));
    
    create table deliveries(
    delivery_id int auto_increment primary key,
    partner_id int not null,
    order_id int not null,
    assigned_id int not null,
    pickup_time time not null,
    delivery_time time not null,
    delivery_status varchar(150),
    foreign key (order_id) references orders(order_id),
    foreign key (partner_id) references delivery_partner(partner_id));
    
    INSERT INTO customers
(first_name, last_name, email, address, phone, registration_date, cus_status)
VALUES
('Aarav', 'Sharma', 'aarav.sharma01@gmail.com', '12 MG Road, Mumbai', 9876500001, '2025-01-05', 'Active'),
('Priya', 'Patil', 'priya.patil02@gmail.com', '24 FC Road, Pune', 9876500002, '2025-01-08', 'Active'),
('Rohan', 'Deshmukh', 'rohan.deshmukh03@gmail.com', '18 Station Road, Nashik', 9876500003, '2025-01-12', 'Active'),
('Sneha', 'Kulkarni', 'sneha.kulkarni04@gmail.com', '35 College Road, Pune', 9876500004, '2025-01-15', 'Active'),
('Aditya', 'Joshi', 'aditya.joshi05@gmail.com', '45 Andheri East, Mumbai', 9876500005, '2025-01-20', 'Active'),
('Neha', 'Pawar', 'neha.pawar06@gmail.com', '22 Shivaji Nagar, Pune', 9876500006, '2025-01-24', 'Active'),
('Vikram', 'More', 'vikram.more07@gmail.com', '17 Gangapur Road, Nashik', 9876500007, '2025-01-28', 'Inactive'),
('Ananya', 'Mehta', 'ananya.mehta08@gmail.com', '56 Bandra West, Mumbai', 9876500008, '2025-02-02', 'Active'),
('Karan', 'Shinde', 'karan.shinde09@gmail.com', '31 Wakad Road, Pune', 9876500009, '2025-02-06', 'Active'),
('Isha', 'Bhosale', 'isha.bhosale10@gmail.com', '14 Camp Area, Pune', 9876500010, '2025-02-10', 'Active'),

('Rahul', 'Jadhav', 'rahul.jadhav11@gmail.com', '29 Thane West, Thane', 9876500011, '2025-02-14', 'Active'),
('Pooja', 'Chavan', 'pooja.chavan12@gmail.com', '41 Kothrud, Pune', 9876500012, '2025-02-18', 'Active'),
('Siddharth', 'Rane', 'siddharth.rane13@gmail.com', '63 Dadar West, Mumbai', 9876500013, '2025-02-22', 'Inactive'),
('Kavya', 'Nair', 'kavya.nair14@gmail.com', '27 Vashi, Navi Mumbai', 9876500014, '2025-02-25', 'Active'),
('Manish', 'Gupta', 'manish.gupta15@gmail.com', '19 Powai, Mumbai', 9876500015, '2025-03-01', 'Active'),
('Riya', 'Kadam', 'riya.kadam16@gmail.com', '33 Hinjewadi, Pune', 9876500016, '2025-03-05', 'Active'),
('Akash', 'Suryawanshi', 'akash.suryawanshi17@gmail.com', '48 Satara Road, Pune', 9876500017, '2025-03-09', 'Active'),
('Simran', 'Kaur', 'simran.kaur18@gmail.com', '15 Sion, Mumbai', 9876500018, '2025-03-13', 'Inactive'),
('Nikhil', 'Wagh', 'nikhil.wagh19@gmail.com', '72 Nashik Road, Nashik', 9876500019, '2025-03-17', 'Active'),
('Tanvi', 'Sawant', 'tanvi.sawant20@gmail.com', '25 Borivali West, Mumbai', 9876500020, '2025-03-21', 'Active'),

('Yash', 'Thakur', 'yash.thakur21@gmail.com', '38 Aundh, Pune', 9876500021, '2025-03-25', 'Active'),
('Mitali', 'Gokhale', 'mitali.gokhale22@gmail.com', '16 Vile Parle, Mumbai', 9876500022, '2025-03-29', 'Active'),
('Omkar', 'Kale', 'omkar.kale23@gmail.com', '54 Karve Road, Pune', 9876500023, '2025-04-02', 'Inactive'),
('Shreya', 'Desai', 'shreya.desai24@gmail.com', '21 Matunga, Mumbai', 9876500024, '2025-04-06', 'Active'),
('Saurabh', 'Mane', 'saurabh.mane25@gmail.com', '47 Deccan, Pune', 9876500025, '2025-04-10', 'Active'),
('Aditi', 'Bapat', 'aditi.bapat26@gmail.com', '62 Kalyan West, Kalyan', 9876500026, '2025-04-14', 'Active'),
('Harsh', 'Pawar', 'harsh.pawar27@gmail.com', '11 Ulhasnagar, Thane', 9876500027, '2025-04-18', 'Active'),
('Nandini', 'Mhatre', 'nandini.mhatre28@gmail.com', '36 Nerul, Navi Mumbai', 9876500028, '2025-04-22', 'Inactive'),
('Abhishek', 'Verma', 'abhishek.verma29@gmail.com', '44 Goregaon East, Mumbai', 9876500029, '2025-04-26', 'Active'),
('Komal', 'Yadav', 'komal.yadav30@gmail.com', '28 Pimpri, Pune', 9876500030, '2025-04-30', 'Active'),

('Vivek', 'Raut', 'vivek.raut31@gmail.com', '39 Vartak Nagar, Thane', 9876500031, '2025-05-04', 'Active'),
('Sakshi', 'Pansare', 'sakshi.pansare32@gmail.com', '52 Baner, Pune', 9876500032, '2025-05-08', 'Active'),
('Dhruv', 'Shah', 'dhruv.shah33@gmail.com', '23 Malad West, Mumbai', 9876500033, '2025-05-12', 'Inactive'),
('Pallavi', 'Kadam', 'pallavi.kadam34@gmail.com', '67 Hadapsar, Pune', 9876500034, '2025-05-16', 'Active'),
('Raj', 'Malhotra', 'raj.malhotra35@gmail.com', '18 Chembur, Mumbai', 9876500035, '2025-05-20', 'Active'),
('Meera', 'Iyer', 'meera.iyer36@gmail.com', '42 Powai, Mumbai', 9876500036, '2025-05-24', 'Active'),
('Tejas', 'Bhave', 'tejas.bhave37@gmail.com', '31 Pimple Saudagar, Pune', 9876500037, '2025-05-28', 'Active'),
('Rutuja', 'Koli', 'rutuja.koli38@gmail.com', '59 Dombivli East, Thane', 9876500038, '2025-06-01', 'Inactive'),
('Sameer', 'Khan', 'sameer.khan39@gmail.com', '26 Kurla West, Mumbai', 9876500039, '2025-06-05', 'Active'),
('Anjali', 'Mishra', 'anjali.mishra40@gmail.com', '73 Kharadi, Pune', 9876500040, '2025-06-09', 'Active'),

('Ritesh', 'Salunkhe', 'ritesh.salunkhe41@gmail.com', '34 Wakad, Pune', 9876500041, '2025-06-13', 'Active'),
('Vaishnavi', 'Borkar', 'vaishnavi.borkar42@gmail.com', '49 Mulund West, Mumbai', 9876500042, '2025-06-17', 'Active'),
('Gaurav', 'Singh', 'gaurav.singh43@gmail.com', '61 Thane East, Thane', 9876500043, '2025-06-21', 'Inactive'),
('Poonam', 'Jain', 'poonam.jain44@gmail.com', '37 Viman Nagar, Pune', 9876500044, '2025-06-25', 'Active'),
('Amol', 'Nikam', 'amol.nikam45@gmail.com', '20 Nashik Road, Nashik', 9876500045, '2025-06-29', 'Active'),
('Swati', 'Raut', 'swati.raut46@gmail.com', '55 Bhandup West, Mumbai', 9876500046, '2025-07-03', 'Active'),
('Pranav', 'Kamble', 'pranav.kamble47@gmail.com', '13 Katraj, Pune', 9876500047, '2025-07-07', 'Inactive'),
('Bhagyashree', 'Mane', 'bhagyashree.mane48@gmail.com', '46 Ambernath, Thane', 9876500048, '2025-07-11', 'Active'),
('Chetan', 'Dhumal', 'chetan.dhumal49@gmail.com', '32 Bhosari, Pune', 9876500049, '2025-07-15', 'Active'),
('Sonal', 'Patil', 'sonal.patil50@gmail.com', '58 Andheri West, Mumbai', 9876500050, '2025-07-19', 'Active');
    
  alter table restaurants
  modify phone varchar(15) not null unique;
  
  INSERT INTO restaurants
(owner_name, email, address, phone, opening_time, closing_time)
VALUES
('Rajesh Sharma', 'rajesh.sharma@foodhub.com', '12 MG Road, Mumbai', 9876100001, '09:00:00', '22:00:00'),
('Priya Patil', 'priya.patil@spicevilla.com', '24 FC Road, Pune', 9876100002, '10:00:00', '23:00:00'),
('Amit Deshmukh', 'amit.deshmukh@tastytreats.com', '18 College Road, Nashik', 9876100003, '08:00:00', '22:30:00'),
('Sneha Kulkarni', 'sneha.kulkarni@greenleaf.com', '35 Baner Road, Pune', 9876100004, '11:00:00', '23:00:00'),
('Vikram Joshi', 'vikram.joshi@royaldine.com', '45 Andheri West, Mumbai', 9876100005, '10:00:00', '23:30:00'),
('Neha Pawar', 'neha.pawar@urbanbites.com', '22 Shivaji Nagar, Pune', 9876100006, '09:30:00', '22:00:00'),
('Rohan More', 'rohan.more@foodcourt.com', '17 Gangapur Road, Nashik', 9876100007, '08:30:00', '21:30:00'),
('Ananya Mehta', 'ananya.mehta@flavorhouse.com', '56 Bandra West, Mumbai', 9876100008, '11:00:00', '23:59:00'),
('Karan Shinde', 'karan.shinde@desikitchen.com', '31 Wakad Road, Pune', 9876100009, '10:30:00', '22:30:00'),
('Isha Bhosale', 'isha.bhosale@foodcorner.com', '14 Camp Area, Pune', 9876100010, '09:00:00', '22:00:00'),
('Rahul Jadhav', 'rahul.jadhav@spicegarden.com', '29 Thane West, Thane', 9876100011, '10:00:00', '23:00:00'),
('Pooja Chavan', 'pooja.chavan@deliciouspoint.com', '41 Kothrud, Pune', 9876100012, '11:00:00', '22:30:00'),
('Siddharth Rane', 'siddharth.rane@foodstation.com', '63 Dadar West, Mumbai', 9876100013, '09:30:00', '23:00:00'),
('Kavya Nair', 'kavya.nair@tastykitchen.com', '27 Vashi, Navi Mumbai', 9876100014, '10:00:00', '22:00:00'),
('Manish Gupta', 'manish.gupta@royalspice.com', '19 Powai, Mumbai', 9876100015, '11:00:00', '23:30:00');
  
INSERT INTO food_categories (categorie_name)
VALUES
('Indian'),
('Chinese'),
('Italian'),
('Mexican'),
('South Indian'),
('North Indian'),
('Fast Food'),
('Desserts'),
('Beverages'),
('Continental');

INSERT INTO menu_items
(restaurant_id, categorie_id, item_name, price)
VALUES
(1, 1, 'Butter Chicken', 320.00),
(1, 1, 'Paneer Tikka Masala', 280.00),
(1, 6, 'Dal Makhani', 220.00),
(1, 7, 'Veg Burger', 160.00),
(1, 8, 'Gulab Jamun', 90.00),
(1, 9, 'Masala Chai', 60.00),
(1, 2, 'Veg Hakka Noodles', 190.00),

(2, 1, 'Chicken Biryani', 300.00),
(2, 6, 'Paneer Butter Masala', 260.00),
(2, 7, 'Chicken Burger', 220.00),
(2, 8, 'Rasmalai', 110.00),
(2, 9, 'Mango Lassi', 100.00),
(2, 2, 'Chicken Manchurian', 240.00),

(3, 5, 'Masala Dosa', 140.00),
(3, 5, 'Idli Sambar', 100.00),
(3, 5, 'Medu Vada', 110.00),
(3, 9, 'Filter Coffee', 70.00),
(3, 8, 'Payasam', 100.00),
(3, 1, 'South Indian Thali', 280.00),
(3, 7, 'Veg Sandwich', 130.00),

(4, 3, 'Margherita Pizza', 280.00),
(4, 3, 'Farmhouse Pizza', 360.00),
(4, 3, 'Pasta Alfredo', 300.00),
(4, 3, 'Penne Arrabbiata', 280.00),
(4, 8, 'Tiramisu', 180.00),
(4, 9, 'Cold Coffee', 130.00),
(4, 7, 'Cheese Garlic Bread', 180.00),

(5, 2, 'Veg Fried Rice', 190.00),
(5, 2, 'Chicken Fried Rice', 240.00),
(5, 2, 'Veg Manchurian', 200.00),
(5, 2, 'Chicken Chilli', 260.00),
(5, 7, 'Crispy Chicken Burger', 230.00),
(5, 9, 'Lemon Iced Tea', 100.00),
(5, 8, 'Chocolate Brownie', 150.00),

(6, 4, 'Veg Tacos', 220.00),
(6, 4, 'Chicken Tacos', 280.00),
(6, 4, 'Cheese Quesadilla', 240.00),
(6, 4, 'Chicken Burrito', 320.00),
(6, 8, 'Churros', 160.00),
(6, 9, 'Virgin Mojito', 140.00),
(6, 7, 'Mexican Nachos', 200.00),

(7, 6, 'Chole Bhature', 180.00),
(7, 6, 'Rajma Chawal', 170.00),
(7, 6, 'Aloo Paratha', 130.00),
(7, 6, 'Paneer Tikka', 250.00),
(7, 1, 'North Indian Thali', 290.00),
(7, 8, 'Jalebi', 100.00),
(7, 9, 'Sweet Lassi', 90.00),

(8, 1, 'Chicken Tikka', 300.00),
(8, 1, 'Mutton Rogan Josh', 380.00),
(8, 1, 'Chicken Curry', 290.00),
(8, 6, 'Shahi Paneer', 270.00),
(8, 6, 'Jeera Rice', 140.00),
(8, 8, 'Kulfi', 100.00),
(8, 9, 'Masala Chaas', 70.00),

(9, 7, 'Classic Veg Burger', 150.00),
(9, 7, 'French Fries', 120.00),
(9, 7, 'Cheese Burger', 190.00),
(9, 7, 'Veg Pizza', 250.00),
(9, 7, 'Chicken Wings', 280.00),
(9, 9, 'Coke', 60.00),
(9, 8, 'Chocolate Cake', 160.00),

(10, 3, 'Four Cheese Pizza', 420.00),
(10, 3, 'Veg Lasagna', 340.00),
(10, 3, 'Chicken Pasta', 320.00),
(10, 3, 'Mushroom Risotto', 360.00),
(10, 8, 'Cheesecake', 200.00),
(10, 9, 'Fresh Lime Soda', 90.00),
(10, 7, 'Bruschetta', 180.00),

(11, 2, 'Schezwan Noodles', 210.00),
(11, 2, 'Schezwan Fried Rice', 220.00),
(11, 2, 'Chilli Paneer', 240.00),
(11, 2, 'Dragon Chicken', 290.00),
(11, 7, 'Spring Rolls', 160.00),
(11, 8, 'Honey Noodles', 140.00),
(11, 9, 'Green Tea', 80.00),

(12, 5, 'Mysore Masala Dosa', 170.00),
(12, 5, 'Pongal', 120.00),
(12, 5, 'Uttapam', 140.00),
(12, 5, 'Curd Rice', 110.00),
(12, 1, 'South Indian Meals', 260.00),
(12, 8, 'Kesari Halwa', 100.00),
(12, 9, 'Filter Coffee', 70.00),

(13, 4, 'Chicken Enchiladas', 320.00),
(13, 4, 'Bean Burrito', 250.00),
(13, 4, 'Cheese Nachos', 200.00),
(13, 4, 'Mexican Rice Bowl', 280.00),
(13, 8, 'Caramel Flan', 150.00),
(13, 9, 'Mango Cooler', 130.00),

(14, 6, 'Butter Naan', 60.00),
(14, 6, 'Garlic Naan', 80.00),
(14, 6, 'Dal Tadka', 190.00),
(14, 6, 'Palak Paneer', 260.00),
(14, 6, 'Kadhai Paneer', 270.00),
(14, 8, 'Gajar Halwa', 120.00),
(14, 9, 'Mango Lassi', 100.00),

(15, 10, 'Grilled Vegetable Platter', 350.00),
(15, 10, 'Grilled Chicken', 420.00),
(15, 10, 'Creamy Mushroom Soup', 180.00),
(15, 10, 'Chicken Steak', 480.00),
(15, 3, 'Pasta Primavera', 320.00),
(15, 8, 'Chocolate Mousse', 180.00),
(15, 9, 'Fresh Orange Juice', 120.00);

alter table delivery_partner
  modify phone varchar(15) not null unique;
  
INSERT INTO delivery_partner
(partner_name, phone, joining_date, vechical_type, vechical_no, partner_status)
VALUES
('Amit Patil', 9876200001, '2024-01-10', 'Bike', 'MH12AB1001', 'Active'),
('Rahul Sharma', 9876200002, '2024-01-15', 'Bike', 'MH12AB1002', 'Active'),
('Suresh Jadhav', 9876200003, '2024-01-22', 'Scooter', 'MH14CD2001', 'Active'),
('Vikas More', 9876200004, '2024-02-05', 'Bike', 'MH01EF3001', 'Inactive'),
('Rohit Shinde', 9876200005, '2024-02-12', 'Bike', 'MH43GH4001', 'Active'),

('Akash Pawar', 9876200006, '2024-02-20', 'Scooter', 'MH12IJ5001', 'Active'),
('Nikhil Deshmukh', 9876200007, '2024-03-01', 'Bike', 'MH14KL6001', 'Active'),
('Sameer Kulkarni', 9876200008, '2024-03-08', 'Bike', 'MH01MN7001', 'Active'),
('Prasad Chavan', 9876200009, '2024-03-15', 'Scooter', 'MH43OP8001', 'Inactive'),
('Karan Bhosale', 9876200010, '2024-03-22', 'Bike', 'MH12QR9001', 'Active'),

('Mahesh Raut', 9876200011, '2024-04-05', 'Bike', 'MH14ST1002', 'Active'),
('Ganesh Sawant', 9876200012, '2024-04-12', 'Scooter', 'MH01UV1101', 'Active'),
('Chetan Mane', 9876200013, '2024-04-20', 'Bike', 'MH43WX1201', 'Active'),
('Ramesh Pawar', 9876200014, '2024-05-02', 'Bike', 'MH12YZ1301', 'Inactive'),
('Vivek Patil', 9876200015, '2024-05-10', 'Scooter', 'MH14AB1401', 'Active'),

('Sanjay More', 9876200016, '2024-05-18', 'Bike', 'MH01CD1501', 'Active'),
('Deepak Shinde', 9876200017, '2024-06-01', 'Bike', 'MH43EF1601', 'Active'),
('Manoj Jadhav', 9876200018, '2024-06-08', 'Scooter', 'MH12GH1701', 'Active'),
('Sachin Joshi', 9876200019, '2024-06-15', 'Bike', 'MH14IJ1801', 'Inactive'),
('Amol Desai', 9876200020, '2024-06-22', 'Bike', 'MH01KL1901', 'Active'),

('Ravi Kumar', 9876200021, '2024-07-05', 'Scooter', 'MH43MN2001', 'Active'),
('Harish Yadav', 9876200022, '2024-07-12', 'Bike', 'MH12OP2101', 'Active'),
('Dinesh Verma', 9876200023, '2024-07-20', 'Bike', 'MH14QR2201', 'Active'),
('Ajay Singh', 9876200024, '2024-08-01', 'Scooter', 'MH01ST2301', 'Inactive'),
('Pravin Kale', 9876200025, '2024-08-10', 'Bike', 'MH43UV2401', 'Active');


INSERT INTO orders
(customer_id, restaurant_id, partner_id, order_date, delivery_address, order_status, total_cost)
VALUES
(1, 1, 1, '2025-08-01', '12 MG Road, Mumbai', 'Delivered', 650.00),
(2, 2, 2, '2025-08-01', '24 FC Road, Pune', 'Delivered', 520.00),
(3, 3, 3, '2025-08-02', '18 College Road, Nashik', 'Delivered', 390.00),
(4, 4, 4, '2025-08-02', '35 Baner Road, Pune', 'Delivered', 780.00),
(5, 5, 5, '2025-08-03', '45 Andheri West, Mumbai', 'Delivered', 620.00),
(6, 6, 6, '2025-08-03', '22 Shivaji Nagar, Pune', 'Delivered', 540.00),
(7, 7, 7, '2025-08-04', '17 Gangapur Road, Nashik', 'Delivered', 450.00),
(8, 8, 8, '2025-08-04', '56 Bandra West, Mumbai', 'Out for Delivery', 720.00),
(9, 9, 9, '2025-08-05', '31 Wakad Road, Pune', 'Delivered', 410.00),
(10, 10, 10, '2025-08-05', '14 Camp Area, Pune', 'Delivered', 680.00),

(11, 11, 11, '2025-08-06', '29 Thane West, Thane', 'Delivered', 590.00),
(12, 12, 12, '2025-08-06', '41 Kothrud, Pune', 'Preparing', 430.00),
(13, 13, 13, '2025-08-07', '63 Dadar West, Mumbai', 'Delivered', 750.00),
(14, 14, 14, '2025-08-07', '27 Vashi, Navi Mumbai', 'Delivered', 480.00),
(15, 15, 15, '2025-08-08', '19 Powai, Mumbai', 'Delivered', 920.00),
(16, 1, 16, '2025-08-08', '33 Hinjewadi, Pune', 'Delivered', 560.00),
(17, 2, 17, '2025-08-09', '48 Satara Road, Pune', 'Delivered', 690.00),
(18, 3, 18, '2025-08-09', '15 Sion, Mumbai', 'Cancelled', 350.00),
(19, 4, 19, '2025-08-10', '72 Nashik Road, Nashik', 'Delivered', 810.00),
(20, 5, 20, '2025-08-10', '25 Borivali West, Mumbai', 'Delivered', 470.00),

(21, 6, 21, '2025-08-11', '38 Aundh, Pune', 'Delivered', 580.00),
(22, 7, 22, '2025-08-11', '16 Vile Parle, Mumbai', 'Delivered', 430.00),
(23, 8, 23, '2025-08-12', '54 Karve Road, Pune', 'Out for Delivery', 760.00),
(24, 9, 24, '2025-08-12', '21 Matunga, Mumbai', 'Delivered', 390.00),
(25, 10, 25, '2025-08-13', '47 Deccan, Pune', 'Delivered', 670.00),
(26, 11, 1, '2025-08-13', '62 Kalyan West, Kalyan', 'Delivered', 520.00),
(27, 12, 2, '2025-08-14', '11 Ulhasnagar, Thane', 'Delivered', 460.00),
(28, 13, 3, '2025-08-14', '36 Nerul, Navi Mumbai', 'Preparing', 710.00),
(29, 14, 4, '2025-08-15', '44 Goregaon East, Mumbai', 'Delivered', 610.00),
(30, 15, 5, '2025-08-15', '28 Pimpri, Pune', 'Delivered', 840.00),

(31, 1, 6, '2025-08-16', '39 Vartak Nagar, Thane', 'Delivered', 530.00),
(32, 2, 7, '2025-08-16', '52 Baner, Pune', 'Delivered', 690.00),
(33, 3, 8, '2025-08-17', '23 Malad West, Mumbai', 'Cancelled', 370.00),
(34, 4, 9, '2025-08-17', '67 Hadapsar, Pune', 'Delivered', 820.00),
(35, 5, 10, '2025-08-18', '18 Chembur, Mumbai', 'Delivered', 580.00),
(36, 6, 11, '2025-08-18', '42 Powai, Mumbai', 'Delivered', 640.00),
(37, 7, 12, '2025-08-19', '31 Pimple Saudagar, Pune', 'Delivered', 450.00),
(38, 8, 13, '2025-08-19', '59 Dombivli East, Thane', 'Delivered', 730.00),
(39, 9, 14, '2025-08-20', '26 Kurla West, Mumbai', 'Out for Delivery', 490.00),
(40, 10, 15, '2025-08-20', '73 Kharadi, Pune', 'Delivered', 770.00),

(41, 11, 16, '2025-08-21', '34 Wakad, Pune', 'Delivered', 620.00),
(42, 12, 17, '2025-08-21', '49 Mulund West, Mumbai', 'Delivered', 440.00),
(43, 13, 18, '2025-08-22', '61 Thane East, Thane', 'Preparing', 680.00),
(44, 14, 19, '2025-08-22', '37 Viman Nagar, Pune', 'Delivered', 570.00),
(45, 15, 20, '2025-08-23', '20 Nashik Road, Nashik', 'Delivered', 890.00),
(46, 1, 21, '2025-08-23', '55 Bhandup West, Mumbai', 'Delivered', 510.00),
(47, 2, 22, '2025-08-24', '13 Katraj, Pune', 'Delivered', 630.00),
(48, 3, 23, '2025-08-24', '46 Ambernath, Thane', 'Cancelled', 420.00),
(49, 4, 24, '2025-08-25', '32 Bhosari, Pune', 'Delivered', 760.00),
(50, 5, 25, '2025-08-25', '58 Andheri West, Mumbai', 'Delivered', 550.00),

(1, 6, 1, '2025-08-26', '12 MG Road, Mumbai', 'Delivered', 470.00),
(2, 7, 2, '2025-08-26', '24 FC Road, Pune', 'Delivered', 520.00),
(3, 8, 3, '2025-08-27', '18 College Road, Nashik', 'Delivered', 830.00),
(4, 9, 4, '2025-08-27', '35 Baner Road, Pune', 'Delivered', 380.00),
(5, 10, 5, '2025-08-28', '45 Andheri West, Mumbai', 'Out for Delivery', 710.00),
(6, 11, 6, '2025-08-28', '22 Shivaji Nagar, Pune', 'Delivered', 590.00),
(7, 12, 7, '2025-08-29', '17 Gangapur Road, Nashik', 'Delivered', 450.00),
(8, 13, 8, '2025-08-29', '56 Bandra West, Mumbai', 'Preparing', 760.00),
(9, 14, 9, '2025-08-30', '31 Wakad Road, Pune', 'Delivered', 610.00),
(10, 15, 10, '2025-08-30', '14 Camp Area, Pune', 'Delivered', 940.00),

(11, 1, 11, '2025-08-31', '29 Thane West, Thane', 'Delivered', 550.00),
(12, 2, 12, '2025-08-31', '41 Kothrud, Pune', 'Delivered', 680.00),
(13, 3, 13, '2025-09-01', '63 Dadar West, Mumbai', 'Delivered', 420.00),
(14, 4, 14, '2025-09-01', '27 Vashi, Navi Mumbai', 'Delivered', 780.00),
(15, 5, 15, '2025-09-02', '19 Powai, Mumbai', 'Cancelled', 630.00),
(16, 6, 16, '2025-09-02', '33 Hinjewadi, Pune', 'Delivered', 510.00),
(17, 7, 17, '2025-09-03', '48 Satara Road, Pune', 'Delivered', 460.00),
(18, 8, 18, '2025-09-03', '15 Sion, Mumbai', 'Delivered', 820.00),
(19, 9, 19, '2025-09-04', '72 Nashik Road, Nashik', 'Delivered', 390.00),
(20, 10, 20, '2025-09-04', '25 Borivali West, Mumbai', 'Out for Delivery', 690.00),

(21, 11, 21, '2025-09-05', '38 Aundh, Pune', 'Delivered', 580.00),
(22, 12, 22, '2025-09-05', '16 Vile Parle, Mumbai', 'Delivered', 450.00),
(23, 13, 23, '2025-09-06', '54 Karve Road, Pune', 'Delivered', 720.00),
(24, 14, 24, '2025-09-06', '21 Matunga, Mumbai', 'Preparing', 530.00),
(25, 15, 25, '2025-09-07', '47 Deccan, Pune', 'Delivered', 880.00),
(26, 1, 1, '2025-09-07', '62 Kalyan West, Kalyan', 'Delivered', 490.00),
(27, 2, 2, '2025-09-08', '11 Ulhasnagar, Thane', 'Delivered', 610.00),
(28, 3, 3, '2025-09-08', '36 Nerul, Navi Mumbai', 'Cancelled', 370.00),
(29, 4, 4, '2025-09-09', '44 Goregaon East, Mumbai', 'Delivered', 750.00),
(30, 5, 5, '2025-09-09', '28 Pimpri, Pune', 'Delivered', 560.00),

(31, 6, 6, '2025-09-10', '39 Vartak Nagar, Thane', 'Delivered', 640.00),
(32, 7, 7, '2025-09-10', '52 Baner, Pune', 'Delivered', 470.00),
(33, 8, 8, '2025-09-11', '23 Malad West, Mumbai', 'Out for Delivery', 810.00),
(34, 9, 9, '2025-09-11', '67 Hadapsar, Pune', 'Delivered', 430.00),
(35, 10, 10, '2025-09-12', '18 Chembur, Mumbai', 'Delivered', 720.00),
(36, 11, 11, '2025-09-12', '42 Powai, Mumbai', 'Preparing', 580.00),
(37, 12, 12, '2025-09-13', '31 Pimple Saudagar, Pune', 'Delivered', 450.00),
(38, 13, 13, '2025-09-13', '59 Dombivli East, Thane', 'Delivered', 760.00),
(39, 14, 14, '2025-09-14', '26 Kurla West, Mumbai', 'Delivered', 520.00),
(40, 15, 15, '2025-09-14', '73 Kharadi, Pune', 'Delivered', 910.00),

(41, 1, 16, '2025-09-15', '34 Wakad, Pune', 'Delivered', 570.00),
(42, 2, 17, '2025-09-15', '49 Mulund West, Mumbai', 'Delivered', 650.00),
(43, 3, 18, '2025-09-16', '61 Thane East, Thane', 'Cancelled', 390.00),
(44, 4, 19, '2025-09-16', '37 Viman Nagar, Pune', 'Delivered', 740.00),
(45, 5, 20, '2025-09-17', '20 Nashik Road, Nashik', 'Delivered', 850.00),
(46, 6, 21, '2025-09-17', '55 Bhandup West, Mumbai', 'Out for Delivery', 480.00),
(47, 7, 22, '2025-09-18', '13 Katraj, Pune', 'Delivered', 620.00),
(48, 8, 23, '2025-09-18', '46 Ambernath, Thane', 'Delivered', 790.00),
(49, 9, 24, '2025-09-19', '32 Bhosari, Pune', 'Preparing', 410.00),
(50, 10, 25, '2025-09-19', '58 Andheri West, Mumbai', 'Delivered', 670.00),

(1, 11, 1, '2025-09-20', '12 MG Road, Mumbai', 'Delivered', 590.00),
(2, 12, 2, '2025-09-20', '24 FC Road, Pune', 'Delivered', 440.00),
(3, 13, 3, '2025-09-21', '18 College Road, Nashik', 'Delivered', 730.00),
(4, 14, 4, '2025-09-21', '35 Baner Road, Pune', 'Delivered', 520.00),
(5, 15, 5, '2025-09-22', '45 Andheri West, Mumbai', 'Out for Delivery', 890.00),
(6, 1, 6, '2025-09-22', '22 Shivaji Nagar, Pune', 'Delivered', 480.00),
(7, 2, 7, '2025-09-23', '17 Gangapur Road, Nashik', 'Delivered', 650.00),
(8, 3, 8, '2025-09-23', '56 Bandra West, Mumbai', 'Delivered', 390.00),
(9, 4, 9, '2025-09-24', '31 Wakad Road, Pune', 'Cancelled', 770.00),
(10, 5, 10, '2025-09-24', '14 Camp Area, Pune', 'Delivered', 610.00),

(11, 6, 11, '2025-09-25', '29 Thane West, Thane', 'Delivered', 550.00),
(12, 7, 12, '2025-09-25', '41 Kothrud, Pune', 'Preparing', 470.00),
(13, 8, 13, '2025-09-26', '63 Dadar West, Mumbai', 'Delivered', 820.00),
(14, 9, 14, '2025-09-26', '27 Vashi, Navi Mumbai', 'Delivered', 430.00),
(15, 10, 15, '2025-09-27', '19 Powai, Mumbai', 'Delivered', 690.00),
(16, 11, 16, '2025-09-27', '33 Hinjewadi, Pune', 'Delivered', 570.00),
(17, 12, 17, '2025-09-28', '48 Satara Road, Pune', 'Out for Delivery', 450.00),
(18, 13, 18, '2025-09-28', '15 Sion, Mumbai', 'Delivered', 740.00),
(19, 14, 19, '2025-09-29', '72 Nashik Road, Nashik', 'Delivered', 530.00),
(20, 15, 20, '2025-09-29', '25 Borivali West, Mumbai', 'Delivered', 920.00),

(21, 1, 21, '2025-09-30', '38 Aundh, Pune', 'Delivered', 490.00),
(22, 2, 22, '2025-09-30', '16 Vile Parle, Mumbai', 'Delivered', 640.00),
(23, 3, 23, '2025-10-01', '54 Karve Road, Pune', 'Preparing', 380.00),
(24, 4, 24, '2025-10-01', '21 Matunga, Mumbai', 'Delivered', 810.00),
(25, 5, 25, '2025-10-02', '47 Deccan, Pune', 'Delivered', 560.00),
(26, 6, 1, '2025-10-02', '62 Kalyan West, Kalyan', 'Cancelled', 430.00),
(27, 7, 2, '2025-10-03', '11 Ulhasnagar, Thane', 'Delivered', 510.00),
(28, 8, 3, '2025-10-03', '36 Nerul, Navi Mumbai', 'Delivered', 780.00),
(29, 9, 4, '2025-10-04', '44 Goregaon East, Mumbai', 'Delivered', 460.00),
(30, 10, 5, '2025-10-04', '28 Pimpri, Pune', 'Out for Delivery', 700.00),

(31, 11, 6, '2025-10-05', '39 Vartak Nagar, Thane', 'Delivered', 590.00),
(32, 12, 7, '2025-10-05', '52 Baner, Pune', 'Delivered', 440.00),
(33, 13, 8, '2025-10-06', '23 Malad West, Mumbai', 'Delivered', 730.00),
(34, 14, 9, '2025-10-06', '67 Hadapsar, Pune', 'Preparing', 520.00),
(35, 15, 10, '2025-10-07', '18 Chembur, Mumbai', 'Delivered', 860.00),
(36, 1, 11, '2025-10-07', '42 Powai, Mumbai', 'Delivered', 470.00),
(37, 2, 12, '2025-10-08', '31 Pimple Saudagar, Pune', 'Delivered', 620.00),
(38, 3, 13, '2025-10-08', '59 Dombivli East, Thane', 'Delivered', 390.00),
(39, 4, 14, '2025-10-09', '26 Kurla West, Mumbai', 'Cancelled', 750.00),
(40, 5, 15, '2025-10-09', '73 Kharadi, Pune', 'Delivered', 680.00),

(41, 6, 16, '2025-10-10', '34 Wakad, Pune', 'Delivered', 540.00),
(42, 7, 17, '2025-10-10', '49 Mulund West, Mumbai', 'Out for Delivery', 470.00),
(43, 8, 18, '2025-10-11', '61 Thane East, Thane', 'Delivered', 790.00),
(44, 9, 19, '2025-10-11', '37 Viman Nagar, Pune', 'Delivered', 420.00),
(45, 10, 20, '2025-10-12', '20 Nashik Road, Nashik', 'Preparing', 910.00),
(46, 11, 21, '2025-10-12', '55 Bhandup West, Mumbai', 'Delivered', 560.00),
(47, 12, 22, '2025-10-13', '13 Katraj, Pune', 'Delivered', 450.00),
(48, 13, 23, '2025-10-13', '46 Ambernath, Thane', 'Delivered', 720.00),
(49, 14, 24, '2025-10-14', '32 Bhosari, Pune', 'Delivered', 510.00),
(50, 15, 25, '2025-10-14', '58 Andheri West, Mumbai', 'Delivered', 840.00),

(1, 1, 1, '2025-10-15', '12 MG Road, Mumbai', 'Delivered', 590.00),
(2, 2, 2, '2025-10-15', '24 FC Road, Pune', 'Delivered', 460.00),
(3, 3, 3, '2025-10-16', '18 College Road, Nashik', 'Delivered', 380.00),
(4, 4, 4, '2025-10-16', '35 Baner Road, Pune', 'Out for Delivery', 790.00),
(5, 5, 5, '2025-10-17', '45 Andheri West, Mumbai', 'Delivered', 620.00),
(6, 6, 6, '2025-10-17', '22 Shivaji Nagar, Pune', 'Preparing', 530.00),
(7, 7, 7, '2025-10-18', '17 Gangapur Road, Nashik', 'Delivered', 440.00),
(8, 8, 8, '2025-10-18', '56 Bandra West, Mumbai', 'Delivered', 850.00),
(9, 9, 9, '2025-10-19', '31 Wakad Road, Pune', 'Delivered', 410.00),
(10, 10, 10, '2025-10-19', '14 Camp Area, Pune', 'Cancelled', 670.00),

(11, 11, 11, '2025-10-20', '29 Thane West, Thane', 'Delivered', 550.00),
(12, 12, 12, '2025-10-20', '41 Kothrud, Pune', 'Delivered', 490.00),
(13, 13, 13, '2025-10-21', '63 Dadar West, Mumbai', 'Delivered', 760.00),
(14, 14, 14, '2025-10-21', '27 Vashi, Navi Mumbai', 'Preparing', 580.00),
(15, 15, 15, '2025-10-22', '19 Powai, Mumbai', 'Delivered', 930.00),
(16, 1, 16, '2025-10-22', '33 Hinjewadi, Pune', 'Delivered', 510.00),
(17, 2, 17, '2025-10-23', '48 Satara Road, Pune', 'Out for Delivery', 680.00),
(18, 3, 18, '2025-10-23', '15 Sion, Mumbai', 'Delivered', 420.00),
(19, 4, 19, '2025-10-24', '72 Nashik Road, Nashik', 'Delivered', 810.00),
(20, 5, 20, '2025-10-24', '25 Borivali West, Mumbai', 'Delivered', 570.00),

(21, 6, 21, '2025-10-25', '38 Aundh, Pune', 'Delivered', 460.00),
(22, 7, 22, '2025-10-25', '16 Vile Parle, Mumbai', 'Delivered', 620.00),
(23, 8, 23, '2025-10-26', '54 Karve Road, Pune', 'Cancelled', 730.00),
(24, 9, 24, '2025-10-26', '21 Matunga, Mumbai', 'Delivered', 390.00),
(25, 10, 25, '2025-10-27', '47 Deccan, Pune', 'Delivered', 700.00),
(26, 11, 1, '2025-10-27', '62 Kalyan West, Kalyan', 'Preparing', 540.00),
(27, 12, 2, '2025-10-28', '11 Ulhasnagar, Thane', 'Delivered', 430.00),
(28, 13, 3, '2025-10-28', '36 Nerul, Navi Mumbai', 'Delivered', 780.00),
(29, 14, 4, '2025-10-29', '44 Goregaon East, Mumbai', 'Out for Delivery', 590.00),
(30, 15, 5, '2025-10-29', '28 Pimpri, Pune', 'Delivered', 880.00),

(31, 1, 6, '2025-10-30', '39 Vartak Nagar, Thane', 'Delivered', 470.00),
(32, 2, 7, '2025-10-30', '52 Baner, Pune', 'Delivered', 650.00),
(33, 3, 8, '2025-10-31', '23 Malad West, Mumbai', 'Delivered', 410.00),
(34, 4, 9, '2025-10-31', '67 Hadapsar, Pune', 'Delivered', 820.00),
(35, 5, 10, '2025-11-01', '18 Chembur, Mumbai', 'Cancelled', 560.00),
(36, 6, 11, '2025-11-01', '42 Powai, Mumbai', 'Delivered', 490.00),
(37, 7, 12, '2025-11-02', '31 Pimple Saudagar, Pune', 'Delivered', 450.00),
(38, 8, 13, '2025-11-02', '59 Dombivli East, Thane', 'Preparing', 760.00),
(39, 9, 14, '2025-11-03', '26 Kurla West, Mumbai', 'Delivered', 520.00),
(40, 10, 15, '2025-11-03', '73 Kharadi, Pune', 'Delivered', 890.00),

(41, 11, 16, '2025-11-04', '34 Wakad, Pune', 'Out for Delivery', 580.00),
(42, 12, 17, '2025-11-04', '49 Mulund West, Mumbai', 'Delivered', 430.00),
(43, 13, 18, '2025-11-05', '61 Thane East, Thane', 'Delivered', 720.00),
(44, 14, 19, '2025-11-05', '37 Viman Nagar, Pune', 'Delivered', 500.00),
(45, 15, 20, '2025-11-06', '20 Nashik Road, Nashik', 'Delivered', 940.00),
(46, 1, 21, '2025-11-06', '55 Bhandup West, Mumbai', 'Preparing', 460.00),
(47, 2, 22, '2025-11-07', '13 Katraj, Pune', 'Delivered', 630.00),
(48, 3, 23, '2025-11-07', '46 Ambernath, Thane', 'Delivered', 390.00),
(49, 4, 24, '2025-11-08', '32 Bhosari, Pune', 'Cancelled', 770.00),
(50, 5, 25, '2025-11-08', '58 Andheri West, Mumbai', 'Delivered', 610.00),

(1, 6, 1, '2025-11-09', '12 MG Road, Mumbai', 'Delivered', 520.00),
(2, 7, 2, '2025-11-09', '24 FC Road, Pune', 'Delivered', 440.00),
(3, 8, 3, '2025-11-10', '18 College Road, Nashik', 'Out for Delivery', 810.00),
(4, 9, 4, '2025-11-10', '35 Baner Road, Pune', 'Delivered', 470.00),
(5, 10, 5, '2025-11-11', '45 Andheri West, Mumbai', 'Delivered', 690.00),
(6, 11, 6, '2025-11-11', '22 Shivaji Nagar, Pune', 'Delivered', 550.00),
(7, 12, 7, '2025-11-12', '17 Gangapur Road, Nashik', 'Preparing', 420.00),
(8, 13, 8, '2025-11-12', '56 Bandra West, Mumbai', 'Delivered', 780.00),
(9, 14, 9, '2025-11-13', '31 Wakad Road, Pune', 'Delivered', 510.00),
(10, 15, 10, '2025-11-13', '14 Camp Area, Pune', 'Delivered', 900.00),

(11, 1, 11, '2025-11-14', '29 Thane West, Thane', 'Delivered', 490.00),
(12, 2, 12, '2025-11-14', '41 Kothrud, Pune', 'Cancelled', 640.00),
(13, 3, 13, '2025-11-15', '63 Dadar West, Mumbai', 'Delivered', 380.00),
(14, 4, 14, '2025-11-15', '27 Vashi, Navi Mumbai', 'Out for Delivery', 820.00),
(15, 5, 15, '2025-11-16', '19 Powai, Mumbai', 'Delivered', 570.00),
(16, 6, 16, '2025-11-16', '33 Hinjewadi, Pune', 'Delivered', 450.00),
(17, 7, 17, '2025-11-17', '48 Satara Road, Pune', 'Delivered', 620.00),
(18, 8, 18, '2025-11-17', '15 Sion, Mumbai', 'Preparing', 740.00),
(19, 9, 19, '2025-11-18', '72 Nashik Road, Nashik', 'Delivered', 430.00),
(20, 10, 20, '2025-11-18', '25 Borivali West, Mumbai', 'Delivered', 680.00),

(21, 11, 21, '2025-11-19', '38 Aundh, Pune', 'Delivered', 550.00),
(22, 12, 22, '2025-11-19', '16 Vile Parle, Mumbai', 'Delivered', 460.00),
(23, 13, 23, '2025-11-20', '54 Karve Road, Pune', 'Cancelled', 790.00),
(24, 14, 24, '2025-11-20', '21 Matunga, Mumbai', 'Delivered', 510.00),
(25, 15, 25, '2025-11-21', '47 Deccan, Pune', 'Out for Delivery', 920.00),
(26, 1, 1, '2025-11-21', '62 Kalyan West, Kalyan', 'Delivered', 480.00),
(27, 2, 2, '2025-11-22', '11 Ulhasnagar, Thane', 'Delivered', 650.00),
(28, 3, 3, '2025-11-22', '36 Nerul, Navi Mumbai', 'Delivered', 410.00),
(29, 4, 4, '2025-11-23', '44 Goregaon East, Mumbai', 'Preparing', 760.00),
(30, 5, 5, '2025-11-23', '28 Pimpri, Pune', 'Delivered', 590.00),

(31, 6, 6, '2025-11-24', '39 Vartak Nagar, Thane', 'Delivered', 430.00),
(32, 7, 7, '2025-11-24', '52 Baner, Pune', 'Delivered', 620.00),
(33, 8, 8, '2025-11-25', '23 Malad West, Mumbai', 'Delivered', 810.00),
(34, 9, 9, '2025-11-25', '67 Hadapsar, Pune', 'Out for Delivery', 450.00),
(35, 10, 10, '2025-11-26', '18 Chembur, Mumbai', 'Delivered', 700.00),
(36, 11, 11, '2025-11-26', '42 Powai, Mumbai', 'Cancelled', 530.00),
(37, 12, 12, '2025-11-27', '31 Pimple Saudagar, Pune', 'Delivered', 460.00),
(38, 13, 13, '2025-11-27', '59 Dombivli East, Thane', 'Delivered', 750.00),
(39, 14, 14, '2025-11-28', '26 Kurla West, Mumbai', 'Preparing', 490.00),
(40, 15, 15, '2025-11-28', '73 Kharadi, Pune', 'Delivered', 880.00),

(41, 1, 16, '2025-11-29', '34 Wakad, Pune', 'Delivered', 560.00),
(42, 2, 17, '2025-11-29', '49 Mulund West, Mumbai', 'Delivered', 440.00),
(43, 3, 18, '2025-11-30', '61 Thane East, Thane', 'Delivered', 710.00),
(44, 4, 19, '2025-11-30', '37 Viman Nagar, Pune', 'Out for Delivery', 520.00),
(45, 5, 20, '2025-12-01', '20 Nashik Road, Nashik', 'Delivered', 930.00),
(46, 6, 21, '2025-12-01', '55 Bhandup West, Mumbai', 'Preparing', 470.00),
(47, 7, 22, '2025-12-02', '13 Katraj, Pune', 'Delivered', 610.00),
(48, 8, 23, '2025-12-02', '46 Ambernath, Thane', 'Delivered', 780.00),
(49, 9, 24, '2025-12-03', '32 Bhosari, Pune', 'Cancelled', 420.00),
(50, 10, 25, '2025-12-03', '58 Andheri West, Mumbai', 'Delivered', 690.00),

(1, 11, 1, '2025-12-04', '12 MG Road, Mumbai', 'Delivered', 580.00),
(2, 12, 2, '2025-12-04', '24 FC Road, Pune', 'Delivered', 450.00),
(3, 13, 3, '2025-12-05', '18 College Road, Nashik', 'Out for Delivery', 760.00),
(4, 14, 4, '2025-12-05', '35 Baner Road, Pune', 'Delivered', 520.00),
(5, 15, 5, '2025-12-06', '45 Andheri West, Mumbai', 'Delivered', 890.00),
(6, 1, 6, '2025-12-06', '22 Shivaji Nagar, Pune', 'Preparing', 490.00),
(7, 2, 7, '2025-12-07', '17 Gangapur Road, Nashik', 'Delivered', 630.00),
(8, 3, 8, '2025-12-07', '56 Bandra West, Mumbai', 'Delivered', 410.00),
(9, 4, 9, '2025-12-08', '31 Wakad Road, Pune', 'Cancelled', 740.00),
(10, 5, 10, '2025-12-08', '14 Camp Area, Pune', 'Delivered', 570.00),

(11, 6, 11, '2025-12-09', '29 Thane West, Thane', 'Delivered', 450.00),
(12, 7, 12, '2025-12-09', '41 Kothrud, Pune', 'Delivered', 620.00),
(13, 8, 13, '2025-12-10', '63 Dadar West, Mumbai', 'Preparing', 810.00),
(14, 9, 14, '2025-12-10', '27 Vashi, Navi Mumbai', 'Delivered', 430.00),
(15, 10, 15, '2025-12-11', '19 Powai, Mumbai', 'Delivered', 920.00),
(16, 11, 16, '2025-12-11', '33 Hinjewadi, Pune', 'Out for Delivery', 560.00),
(17, 12, 17, '2025-12-12', '48 Satara Road, Pune', 'Delivered', 480.00),
(18, 13, 18, '2025-12-12', '15 Sion, Mumbai', 'Delivered', 750.00),
(19, 14, 19, '2025-12-13', '72 Nashik Road, Nashik', 'Cancelled', 390.00),
(20, 15, 20, '2025-12-13', '25 Borivali West, Mumbai', 'Delivered', 860.00),

(21, 1, 21, '2025-12-14', '38 Aundh, Pune', 'Delivered', 520.00),
(22, 2, 22, '2025-12-14', '16 Vile Parle, Mumbai', 'Preparing', 640.00),
(23, 3, 23, '2025-12-15', '54 Karve Road, Pune', 'Delivered', 420.00),
(24, 4, 24, '2025-12-15', '21 Matunga, Mumbai', 'Delivered', 790.00),
(25, 5, 25, '2025-12-16', '47 Deccan, Pune', 'Out for Delivery', 580.00),
(26, 6, 1, '2025-12-16', '62 Kalyan West, Kalyan', 'Delivered', 460.00),
(27, 7, 2, '2025-12-17', '11 Ulhasnagar, Thane', 'Delivered', 610.00),
(28, 8, 3, '2025-12-17', '36 Nerul, Navi Mumbai', 'Delivered', 820.00),
(29, 9, 4, '2025-12-18', '44 Goregaon East, Mumbai', 'Cancelled', 440.00),
(30, 10, 5, '2025-12-18', '28 Pimpri, Pune', 'Delivered', 710.00),

(31, 11, 6, '2025-12-19', '39 Vartak Nagar, Thane', 'Delivered', 530.00),
(32, 12, 7, '2025-12-19', '52 Baner, Pune', 'Preparing', 470.00),
(33, 13, 8, '2025-12-20', '23 Malad West, Mumbai', 'Delivered', 780.00),
(34, 14, 9, '2025-12-20', '67 Hadapsar, Pune', 'Delivered', 510.00),
(35, 15, 10, '2025-12-21', '18 Chembur, Mumbai', 'Delivered', 900.00),
(36, 1, 11, '2025-12-21', '42 Powai, Mumbai', 'Out for Delivery', 450.00),
(37, 2, 12, '2025-12-22', '31 Pimple Saudagar, Pune', 'Delivered', 620.00),
(38, 3, 13, '2025-12-22', '59 Dombivli East, Thane', 'Cancelled', 390.00),
(39, 4, 14, '2025-12-23', '26 Kurla West, Mumbai', 'Delivered', 750.00),
(40, 5, 15, '2025-12-23', '73 Kharadi, Pune', 'Delivered', 680.00),

(41, 6, 16, '2025-12-24', '34 Wakad, Pune', 'Preparing', 540.00),
(42, 7, 17, '2025-12-24', '49 Mulund West, Mumbai', 'Delivered', 460.00),
(43, 8, 18, '2025-12-25', '61 Thane East, Thane', 'Delivered', 810.00),
(44, 9, 19, '2025-12-25', '37 Viman Nagar, Pune', 'Out for Delivery', 490.00),
(45, 10, 20, '2025-12-26', '20 Nashik Road, Nashik', 'Delivered', 940.00),
(46, 11, 21, '2025-12-26', '55 Bhandup West, Mumbai', 'Delivered', 570.00),
(47, 12, 22, '2025-12-27', '13 Katraj, Pune', 'Delivered', 430.00),
(48, 13, 23, '2025-12-27', '46 Ambernath, Thane', 'Preparing', 760.00),
(49, 14, 24, '2025-12-28', '32 Bhosari, Pune', 'Delivered', 520.00),
(50, 15, 25, '2025-12-28', '58 Andheri West, Mumbai', 'Delivered', 870.00),

(1, 1, 1, '2025-12-29', '12 MG Road, Mumbai', 'Delivered', 490.00),
(2, 2, 2, '2025-12-29', '24 FC Road, Pune', 'Cancelled', 650.00),
(3, 3, 3, '2025-12-30', '18 College Road, Nashik', 'Delivered', 430.00),
(4, 4, 4, '2025-12-30', '35 Baner Road, Pune', 'Delivered', 780.00),
(5, 5, 5, '2025-12-31', '45 Andheri West, Mumbai', 'Out for Delivery', 590.00),
(6, 6, 6, '2025-12-31', '22 Shivaji Nagar, Pune', 'Delivered', 470.00),
(7, 7, 7, '2026-01-01', '17 Gangapur Road, Nashik', 'Delivered', 620.00),
(8, 8, 8, '2026-01-01', '56 Bandra West, Mumbai', 'Preparing', 830.00),
(9, 9, 9, '2026-01-02', '31 Wakad Road, Pune', 'Delivered', 450.00),
(10, 10, 10, '2026-01-02', '14 Camp Area, Pune', 'Delivered', 710.00),

(11, 11, 11, '2026-01-03', '29 Thane West, Thane', 'Delivered', 540.00),
(12, 12, 12, '2026-01-03', '41 Kothrud, Pune', 'Out for Delivery', 480.00),
(13, 13, 13, '2026-01-04', '63 Dadar West, Mumbai', 'Delivered', 790.00),
(14, 14, 14, '2026-01-04', '27 Vashi, Navi Mumbai', 'Cancelled', 420.00),
(15, 15, 15, '2026-01-05', '19 Powai, Mumbai', 'Delivered', 930.00),
(16, 1, 16, '2026-01-05', '33 Hinjewadi, Pune', 'Delivered', 550.00),
(17, 2, 17, '2026-01-06', '48 Satara Road, Pune', 'Preparing', 640.00),
(18, 3, 18, '2026-01-06', '15 Sion, Mumbai', 'Delivered', 390.00),
(19, 4, 19, '2026-01-07', '72 Nashik Road, Nashik', 'Delivered', 760.00),
(20, 5, 20, '2026-01-07', '25 Borivali West, Mumbai', 'Out for Delivery', 580.00),

(21, 6, 21, '2026-01-08', '38 Aundh, Pune', 'Delivered', 450.00),
(22, 7, 22, '2026-01-08', '16 Vile Parle, Mumbai', 'Delivered', 620.00),
(23, 8, 23, '2026-01-09', '54 Karve Road, Pune', 'Delivered', 810.00),
(24, 9, 24, '2026-01-09', '21 Matunga, Mumbai', 'Preparing', 430.00),
(25, 10, 25, '2026-01-10', '47 Deccan, Pune', 'Delivered', 700.00),
(26, 11, 1, '2026-01-10', '62 Kalyan West, Kalyan', 'Cancelled', 520.00),
(27, 12, 2, '2026-01-11', '11 Ulhasnagar, Thane', 'Delivered', 470.00),
(28, 13, 3, '2026-01-11', '36 Nerul, Navi Mumbai', 'Delivered', 780.00),
(29, 14, 4, '2026-01-12', '44 Goregaon East, Mumbai', 'Out for Delivery', 560.00),
(30, 15, 5, '2026-01-12', '28 Pimpri, Pune', 'Delivered', 890.00),

(31, 1, 6, '2026-01-13', '39 Vartak Nagar, Thane', 'Delivered', 510.00),
(32, 2, 7, '2026-01-13', '52 Baner, Pune', 'Preparing', 440.00),
(33, 3, 8, '2026-01-14', '23 Malad West, Mumbai', 'Delivered', 730.00),
(34, 4, 9, '2026-01-14', '67 Hadapsar, Pune', 'Delivered', 490.00),
(35, 5, 10, '2026-01-15', '18 Chembur, Mumbai', 'Cancelled', 680.00),
(36, 6, 11, '2026-01-15', '42 Powai, Mumbai', 'Delivered', 530.00),
(37, 7, 12, '2026-01-16', '31 Pimple Saudagar, Pune', 'Delivered', 460.00),
(38, 8, 13, '2026-01-16', '59 Dombivli East, Thane', 'Out for Delivery', 820.00),
(39, 9, 14, '2026-01-17', '26 Kurla West, Mumbai', 'Delivered', 410.00),
(40, 10, 15, '2026-01-17', '73 Kharadi, Pune', 'Delivered', 900.00),

(41, 11, 16, '2026-01-18', '34 Wakad, Pune', 'Preparing', 570.00),
(42, 12, 17, '2026-01-18', '49 Mulund West, Mumbai', 'Delivered', 450.00),
(43, 13, 18, '2026-01-19', '61 Thane East, Thane', 'Delivered', 760.00),
(44, 14, 19, '2026-01-19', '37 Viman Nagar, Pune', 'Cancelled', 520.00),
(45, 15, 20, '2026-01-20', '20 Nashik Road, Nashik', 'Delivered', 940.00),
(46, 1, 21, '2026-01-20', '55 Bhandup West, Mumbai', 'Out for Delivery', 480.00),
(47, 2, 22, '2026-01-21', '13 Katraj, Pune', 'Delivered', 610.00),
(48, 3, 23, '2026-01-21', '46 Ambernath, Thane', 'Delivered', 390.00),
(49, 4, 24, '2026-01-22', '32 Bhosari, Pune', 'Preparing', 780.00),
(50, 5, 25, '2026-01-22', '58 Andheri West, Mumbai', 'Delivered', 650.00);

INSERT INTO items
(order_id, item_id, quantity, amount)
VALUES
(1,1,2,640.00),
(1,5,1,90.00),
(2,8,1,300.00),
(2,12,2,200.00),
(3,14,2,280.00),
(3,17,1,110.00),
(4,21,1,280.00),
(4,22,1,360.00),
(4,26,1,130.00),
(5,28,2,380.00),
(5,30,1,200.00),
(6,34,1,220.00),
(6,35,1,280.00),
(7,41,2,360.00),
(7,43,1,130.00),
(8,48,1,300.00),
(8,49,1,380.00),
(8,53,1,100.00),
(9,57,2,300.00),
(9,58,1,120.00),
(10,64,1,340.00),
(10,66,1,320.00),
(10,68,1,200.00),

(11,71,2,420.00),
(11,73,1,240.00),
(12,78,2,240.00),
(12,80,1,260.00),
(13,84,1,320.00),
(13,85,1,250.00),
(13,87,1,280.00),
(14,91,2,160.00),
(14,93,1,270.00),
(15,97,1,350.00),
(15,98,1,420.00),
(15,100,1,120.00),
(16,2,1,280.00),
(16,4,2,440.00),
(17,9,1,220.00),
(17,13,2,280.00),
(18,15,1,100.00),
(18,16,1,110.00),
(19,23,1,300.00),
(19,24,1,280.00),
(19,25,1,180.00),
(20,29,1,200.00),
(20,31,1,230.00),

(21,36,2,480.00),
(21,40,1,140.00),
(22,42,1,180.00),
(22,44,2,290.00),
(23,50,1,290.00),
(23,52,1,270.00),
(23,56,1,100.00),
(24,59,1,190.00),
(24,61,1,190.00),
(25,65,1,360.00),
(25,67,1,360.00),
(26,72,1,210.00),
(26,74,1,290.00),
(27,79,2,280.00),
(27,82,1,260.00),
(28,86,1,250.00),
(28,88,1,200.00),
(28,90,1,130.00),
(29,92,1,270.00),
(29,94,1,120.00),
(30,96,1,420.00),
(30,99,1,180.00),

(31,3,1,220.00),
(31,7,1,190.00),
(32,10,2,200.00),
(32,11,1,260.00),
(33,18,2,140.00),
(33,19,1,280.00),
(34,27,1,180.00),
(34,28,1,380.00),
(34,32,1,100.00),
(35,33,1,220.00),
(35,37,1,240.00),
(36,38,1,320.00),
(36,39,1,160.00),
(37,45,2,260.00),
(37,46,1,290.00),
(38,51,1,300.00),
(38,54,2,200.00),
(39,55,1,150.00),
(39,60,1,120.00),
(40,62,1,280.00),
(40,63,1,300.00),
(40,69,1,180.00),

(41,70,1,160.00),
(41,75,1,160.00),
(42,76,1,250.00),
(42,77,1,280.00),
(43,81,1,120.00),
(43,83,1,260.00),
(44,89,1,200.00),
(44,95,1,150.00),
(45,97,1,350.00),
(45,98,1,420.00),
(45,99,1,180.00),
(46,1,1,320.00),
(46,6,2,440.00),
(47,8,1,300.00),
(47,10,1,200.00),
(48,14,1,140.00),
(48,17,2,220.00),
(49,21,1,280.00),
(49,25,1,180.00),
(50,29,1,200.00),
(50,30,1,200.00),

(51,34,1,220.00),
(51,35,1,280.00),
(52,41,1,180.00),
(52,43,1,130.00),
(53,48,1,300.00),
(53,50,1,290.00),
(53,56,1,100.00),
(54,57,1,150.00),
(54,59,1,190.00),
(55,64,1,340.00),
(55,66,1,320.00),
(56,71,1,210.00),
(56,73,1,240.00),
(57,78,1,120.00),
(57,80,1,260.00),
(58,84,1,320.00),
(58,87,1,280.00),
(59,91,1,80.00),
(59,93,1,270.00),
(60,97,1,350.00),
(60,100,1,120.00),

(61,2,1,280.00),
(61,5,1,90.00),
(62,9,1,220.00),
(62,13,1,140.00),
(63,15,2,280.00),
(63,20,1,130.00),
(64,22,1,360.00),
(64,23,1,300.00),
(65,28,1,190.00),
(65,31,1,230.00),
(66,36,1,280.00),
(66,40,1,140.00),
(67,42,1,180.00),
(67,44,1,290.00),
(68,49,1,380.00),
(68,52,1,270.00),
(69,58,1,120.00),
(69,61,1,190.00),
(70,64,1,340.00),
(70,68,1,200.00),

(71,72,1,210.00),
(71,74,1,290.00),
(72,79,1,140.00),
(72,82,1,260.00),
(73,85,1,250.00),
(73,86,1,250.00),
(74,92,1,270.00),
(74,94,1,120.00),
(75,97,1,350.00),
(75,98,1,420.00),
(76,3,1,220.00),
(76,7,1,190.00),
(77,11,1,260.00),
(77,12,1,200.00),
(78,16,1,110.00),
(78,18,1,140.00),
(79,21,1,280.00),
(79,26,1,130.00),
(80,29,1,200.00),
(80,33,1,220.00),

(81,34,1,220.00),
(81,37,1,240.00),
(82,41,1,180.00),
(82,46,1,290.00),
(83,48,1,300.00),
(83,53,1,100.00),
(84,55,1,150.00),
(84,58,1,120.00),
(85,64,1,340.00),
(85,67,1,360.00),
(86,71,1,210.00),
(86,73,1,240.00),
(87,78,1,120.00),
(87,81,1,120.00),
(88,84,1,320.00),
(88,88,1,200.00),
(89,91,1,80.00),
(89,95,1,150.00),
(90,97,1,350.00),
(90,100,1,120.00),

(91,1,1,320.00),
(91,5,1,90.00),
(92,8,1,300.00),
(92,12,1,200.00),
(93,14,1,140.00),
(93,17,1,110.00),
(94,21,1,280.00),
(94,24,1,280.00),
(95,28,1,190.00),
(95,30,1,200.00),
(96,34,1,220.00),
(96,35,1,280.00),
(97,41,1,180.00),
(97,43,1,130.00),
(98,48,1,300.00),
(98,49,1,380.00),
(99,57,1,150.00),
(99,59,1,190.00),
(100,64,1,340.00),
(100,66,1,320.00),

(101,71,1,210.00),
(101,73,1,240.00),
(102,78,1,120.00),
(102,80,1,260.00),
(103,84,1,320.00),
(103,85,1,250.00),
(104,91,1,80.00),
(104,93,1,270.00),
(105,97,1,350.00),
(105,99,1,180.00),
(106,2,1,280.00),
(106,4,1,440.00),
(107,9,1,220.00),
(107,13,1,140.00),
(108,15,1,140.00),
(108,16,1,110.00),
(109,22,1,360.00),
(109,26,1,130.00),
(110,28,1,190.00),
(110,31,1,230.00),

(111,36,1,240.00),
(111,40,1,140.00),
(112,42,1,180.00),
(112,44,1,290.00),
(113,48,1,300.00),
(113,52,1,270.00),
(114,57,1,150.00),
(114,61,1,190.00),
(115,64,1,340.00),
(115,68,1,200.00),
(116,71,1,210.00),
(116,74,1,290.00),
(117,79,1,140.00),
(117,82,1,260.00),
(118,84,1,320.00),
(118,87,1,280.00),
(119,91,1,80.00),
(119,94,1,120.00),
(120,97,1,350.00),
(120,100,1,120.00),

(121,3,1,220.00),
(121,7,1,190.00),
(122,10,1,200.00),
(122,11,1,260.00),
(123,14,1,140.00),
(123,18,1,140.00),
(124,21,1,280.00),
(124,25,1,180.00),
(125,29,1,200.00),
(125,30,1,200.00),
(126,34,1,220.00),
(126,39,1,160.00),
(127,41,1,180.00),
(127,45,1,130.00),
(128,48,1,300.00),
(128,50,1,290.00),
(129,55,1,150.00),
(129,60,1,120.00),
(130,64,1,340.00),
(130,67,1,360.00),

(131,72,1,210.00),
(131,73,1,240.00),
(132,78,1,120.00),
(132,80,1,260.00),
(133,84,1,320.00),
(133,88,1,200.00),
(134,91,1,80.00),
(134,95,1,150.00),
(135,97,1,350.00),
(135,98,1,420.00),
(136,1,1,320.00),
(136,6,1,220.00),
(137,8,1,300.00),
(137,13,1,140.00),
(138,15,1,140.00),
(138,17,1,110.00),
(139,21,1,280.00),
(139,22,1,360.00),
(140,28,1,190.00),
(140,32,1,100.00),

(141,36,1,240.00),
(141,38,1,320.00),
(142,42,1,180.00),
(142,44,1,290.00),
(143,48,1,300.00),
(143,54,1,200.00),
(144,57,1,150.00),
(144,58,1,120.00),
(145,64,1,340.00),
(145,65,1,360.00),
(146,71,1,210.00),
(146,75,1,160.00),
(147,78,1,120.00),
(147,83,1,260.00),
(148,84,1,320.00),
(148,86,1,250.00),
(149,91,1,80.00),
(149,93,1,270.00),
(150,97,1,350.00),
(150,100,1,120.00),

(151,2,1,280.00),
(151,5,1,90.00),
(152,9,1,220.00),
(152,10,1,200.00),
(153,14,1,140.00),
(153,16,1,110.00),
(154,21,1,280.00),
(154,23,1,300.00),
(155,28,1,190.00),
(155,29,1,200.00),
(156,34,1,220.00),
(156,35,1,280.00),
(157,41,1,180.00),
(157,46,1,290.00),
(158,48,1,300.00),
(158,49,1,380.00),
(159,57,1,150.00),
(159,59,1,190.00),
(160,64,1,340.00),
(160,68,1,200.00),

(161,71,1,210.00),
(161,73,1,240.00),
(162,78,1,120.00),
(162,82,1,260.00),
(163,84,1,320.00),
(163,85,1,250.00),
(164,91,1,80.00),
(164,94,1,120.00),
(165,97,1,350.00),
(165,98,1,420.00),
(166,3,1,220.00),
(166,7,1,190.00),
(167,11,1,260.00),
(167,12,1,200.00),
(168,15,1,140.00),
(168,17,1,110.00),
(169,21,1,280.00),
(169,26,1,130.00),
(170,29,1,200.00),
(170,33,1,220.00),

(171,34,1,220.00),
(171,37,1,240.00),
(172,41,1,180.00),
(172,43,1,130.00),
(173,48,1,300.00),
(173,53,1,100.00),
(174,55,1,150.00),
(174,58,1,120.00),
(175,64,1,340.00),
(175,66,1,320.00),
(176,71,1,210.00),
(176,74,1,290.00),
(177,78,1,120.00),
(177,80,1,260.00),
(178,84,1,320.00),
(178,87,1,280.00),
(179,91,1,80.00),
(179,95,1,150.00),
(180,97,1,350.00),
(180,99,1,180.00),

(181,1,1,320.00),
(181,4,1,440.00),
(182,8,1,300.00),
(182,10,1,200.00),
(183,14,1,140.00),
(183,17,1,110.00),
(184,21,1,280.00),
(184,24,1,280.00),
(185,28,1,190.00),
(185,30,1,200.00),
(186,34,1,220.00),
(186,35,1,280.00),
(187,41,1,180.00),
(187,43,1,130.00),
(188,48,1,300.00),
(188,52,1,270.00),
(189,57,1,150.00),
(189,61,1,190.00),
(190,64,1,340.00),
(190,68,1,200.00),

(191,71,1,210.00),
(191,73,1,240.00),
(192,78,1,120.00),
(192,80,1,260.00),
(193,84,1,320.00),
(193,88,1,200.00),
(194,91,1,80.00),
(194,93,1,270.00),
(195,97,1,350.00),
(195,100,1,120.00),
(196,2,1,280.00),
(196,6,1,220.00),
(197,9,1,220.00),
(197,13,1,140.00),
(198,15,1,140.00),
(198,18,1,140.00),
(199,21,1,280.00),
(199,25,1,180.00),
(200,29,1,200.00),
(200,31,1,230.00),

(201,36,1,240.00),
(201,40,1,140.00),
(202,42,1,180.00),
(202,44,1,290.00),
(203,48,1,300.00),
(203,50,1,290.00),
(204,57,1,150.00),
(204,59,1,190.00),
(205,64,1,340.00),
(205,67,1,360.00),
(206,71,1,210.00),
(206,73,1,240.00),
(207,78,1,120.00),
(207,82,1,260.00),
(208,84,1,320.00),
(208,87,1,280.00),
(209,91,1,80.00),
(209,95,1,150.00),
(210,97,1,350.00),
(210,98,1,420.00),

(211,3,1,220.00),
(211,7,1,190.00),
(212,11,1,260.00),
(212,12,1,200.00),
(213,15,1,140.00),
(213,16,1,110.00),
(214,21,1,280.00),
(214,23,1,300.00),
(215,28,1,190.00),
(215,31,1,230.00),
(216,34,1,220.00),
(216,38,1,320.00),
(217,41,1,180.00),
(217,46,1,290.00),
(218,48,1,300.00),
(218,54,1,200.00),
(219,55,1,150.00),
(219,60,1,120.00),
(220,64,1,340.00),
(220,68,1,200.00),

(221,71,1,210.00),
(221,74,1,290.00),
(222,78,1,120.00),
(222,83,1,260.00),
(223,84,1,320.00),
(223,86,1,250.00),
(224,91,1,80.00),
(224,94,1,120.00),
(225,97,1,350.00),
(225,99,1,180.00),
(226,1,1,320.00),
(226,5,1,90.00),
(227,8,1,300.00),
(227,13,1,140.00),
(228,14,1,140.00),
(228,17,1,110.00),
(229,21,1,280.00),
(229,26,1,130.00),
(230,29,1,200.00),
(230,33,1,220.00),

(231,34,1,220.00),
(231,37,1,240.00),
(232,41,1,180.00),
(232,43,1,130.00),
(233,48,1,300.00),
(233,53,1,100.00),
(234,57,1,150.00),
(234,58,1,120.00),
(235,64,1,340.00),
(235,66,1,320.00),
(236,71,1,210.00),
(236,75,1,160.00),
(237,78,1,120.00),
(237,80,1,260.00),
(238,84,1,320.00),
(238,88,1,200.00),
(239,91,1,80.00),
(239,93,1,270.00),
(240,97,1,350.00),
(240,100,1,120.00),

(241,2,1,280.00),
(241,4,1,440.00),
(242,9,1,220.00),
(242,10,1,200.00),
(243,14,1,140.00),
(243,18,1,140.00),
(244,21,1,280.00),
(244,25,1,180.00),
(245,28,1,190.00),
(245,30,1,200.00),
(246,34,1,220.00),
(246,35,1,280.00),
(247,41,1,180.00),
(247,45,1,130.00),
(248,48,1,300.00),
(248,52,1,270.00),
(249,55,1,150.00),
(249,61,1,190.00),
(250,64,1,340.00),
(250,67,1,360.00),

(251,72,1,210.00),
(251,73,1,240.00),
(252,78,1,120.00),
(252,82,1,260.00),
(253,84,1,320.00),
(253,87,1,280.00),
(254,91,1,80.00),
(254,95,1,150.00),
(255,97,1,350.00),
(255,98,1,420.00),
(256,1,1,320.00),
(256,6,1,220.00),
(257,8,1,300.00),
(257,12,1,200.00),
(258,15,1,140.00),
(258,17,1,110.00),
(259,21,1,280.00),
(259,22,1,360.00),
(260,28,1,190.00),
(260,31,1,230.00),

(261,36,1,240.00),
(261,38,1,320.00),
(262,42,1,180.00),
(262,44,1,290.00),
(263,48,1,300.00),
(263,50,1,290.00),
(264,57,1,150.00),
(264,59,1,190.00),
(265,64,1,340.00),
(265,68,1,200.00),
(266,71,1,210.00),
(266,74,1,290.00),
(267,78,1,120.00),
(267,80,1,260.00),
(268,84,1,320.00),
(268,86,1,250.00),
(269,91,1,80.00),
(269,94,1,120.00),
(270,97,1,350.00),
(270,100,1,120.00),

(271,3,1,220.00),
(271,7,1,190.00),
(272,11,1,260.00),
(272,13,1,140.00),
(273,15,1,140.00),
(273,16,1,110.00),
(274,21,1,280.00),
(274,24,1,280.00),
(275,28,1,190.00),
(275,32,1,100.00),
(276,34,1,220.00),
(276,37,1,240.00),
(277,41,1,180.00),
(277,46,1,290.00),
(278,48,1,300.00),
(278,54,1,200.00),
(279,55,1,150.00),
(279,60,1,120.00),
(280,64,1,340.00),
(280,66,1,320.00),

(281,71,1,210.00),
(281,73,1,240.00),
(282,78,1,120.00),
(282,82,1,260.00),
(283,84,1,320.00),
(283,85,1,250.00),
(284,91,1,80.00),
(284,93,1,270.00),
(285,97,1,350.00),
(285,99,1,180.00),
(286,2,1,280.00),
(286,5,1,90.00),
(287,9,1,220.00),
(287,10,1,200.00),
(288,14,1,140.00),
(288,17,1,110.00),
(289,21,1,280.00),
(289,26,1,130.00),
(290,29,1,200.00),
(290,30,1,200.00),

(291,34,1,220.00),
(291,35,1,280.00),
(292,41,1,180.00),
(292,43,1,130.00),
(293,48,1,300.00),
(293,49,1,380.00),
(294,57,1,150.00),
(294,59,1,190.00),
(295,64,1,340.00),
(295,68,1,200.00),
(296,71,1,210.00),
(296,74,1,290.00),
(297,78,1,120.00),
(297,80,1,260.00),
(298,84,1,320.00),
(298,87,1,280.00),
(299,91,1,80.00),
(299,95,1,150.00),
(300,97,1,350.00),
(300,100,1,120.00);

```sql
INSERT INTO payments (order_id, payment_method, amount, payment_status) VALUES
(1,'UPI',1250.00,'Completed'),
(2,'Credit Card',2450.50,'Completed'),
(3,'Debit Card',875.25,'Completed'),
(4,'Cash',1500.00,'Pending'),
(5,'Net Banking',3200.75,'Completed'),
(6,'UPI',999.00,'Completed'),
(7,'Credit Card',4500.00,'Refunded'),
(8,'Debit Card',1750.50,'Completed'),
(9,'Cash',800.00,'Completed'),
(10,'Net Banking',2750.25,'Pending'),
(11,'UPI',1350.00,'Completed'),
(12,'Credit Card',5200.00,'Completed'),
(13,'Debit Card',1100.75,'Failed'),
(14,'Cash',950.00,'Completed'),
(15,'Net Banking',3850.50,'Completed'),
(16,'UPI',2250.00,'Pending'),
(17,'Credit Card',6750.25,'Completed'),
(18,'Debit Card',1450.00,'Completed'),
(19,'Cash',700.50,'Refunded'),
(20,'Net Banking',4100.00,'Completed'),
(21,'UPI',1850.75,'Completed'),
(22,'Credit Card',2999.00,'Completed'),
(23,'Debit Card',750.00,'Pending'),
(24,'Cash',1250.50,'Completed'),
(25,'Net Banking',5500.00,'Completed'),
(26,'UPI',950.25,'Failed'),
(27,'Credit Card',3400.00,'Completed'),
(28,'Debit Card',2150.75,'Completed'),
(29,'Cash',600.00,'Completed'),
(30,'Net Banking',4800.50,'Pending'),
(31,'UPI',1750.00,'Completed'),
(32,'Credit Card',6250.25,'Completed'),
(33,'Debit Card',1325.50,'Completed'),
(34,'Cash',900.00,'Failed'),
(35,'Net Banking',3500.75,'Completed'),
(36,'UPI',1450.00,'Completed'),
(37,'Credit Card',2750.50,'Pending'),
(38,'Debit Card',850.25,'Completed'),
(39,'Cash',1200.00,'Refunded'),
(40,'Net Banking',5100.00,'Completed'),
(41,'UPI',1950.75,'Completed'),
(42,'Credit Card',4200.00,'Completed'),
(43,'Debit Card',1150.50,'Pending'),
(44,'Cash',750.00,'Completed'),
(45,'Net Banking',3650.25,'Completed'),
(46,'UPI',2850.00,'Completed'),
(47,'Credit Card',5900.75,'Failed'),
(48,'Debit Card',1650.00,'Completed'),
(49,'Cash',550.50,'Completed'),
(50,'Net Banking',4300.00,'Pending'),
(51,'UPI',1550.25,'Completed'),
(52,'Credit Card',3150.00,'Completed'),
(53,'Debit Card',925.75,'Completed'),
(54,'Cash',1050.00,'Refunded'),
(55,'Net Banking',4750.50,'Completed'),
(56,'UPI',2150.00,'Pending'),
(57,'Credit Card',6800.25,'Completed'),
(58,'Debit Card',1350.50,'Completed'),
(59,'Cash',650.00,'Completed'),
(60,'Net Banking',3900.75,'Completed'),
(61,'UPI',1650.00,'Completed'),
(62,'Credit Card',2850.50,'Failed'),
(63,'Debit Card',1050.25,'Completed'),
(64,'Cash',850.00,'Pending'),
(65,'Net Banking',5250.00,'Completed'),
(66,'UPI',1950.75,'Completed'),
(67,'Credit Card',3750.00,'Completed'),
(68,'Debit Card',1450.50,'Refunded'),
(69,'Cash',725.25,'Completed'),
(70,'Net Banking',4450.00,'Pending'),
(71,'UPI',2350.50,'Completed'),
(72,'Credit Card',5150.00,'Completed'),
(73,'Debit Card',1250.75,'Completed'),
(74,'Cash',950.50,'Failed'),
(75,'Net Banking',3600.00,'Completed'),
(76,'UPI',1750.25,'Completed'),
(77,'Credit Card',6400.50,'Pending'),
(78,'Debit Card',1550.00,'Completed'),
(79,'Cash',675.75,'Completed'),
(80,'Net Banking',4850.00,'Refunded'),
(81,'UPI',2050.50,'Completed'),
(82,'Credit Card',3300.00,'Completed'),
(83,'Debit Card',875.75,'Pending'),
(84,'Cash',1150.00,'Completed'),
(85,'Net Banking',5500.25,'Completed'),
(86,'UPI',1450.50,'Failed'),
(87,'Credit Card',3950.00,'Completed'),
(88,'Debit Card',2250.75,'Completed'),
(89,'Cash',725.00,'Completed'),
(90,'Net Banking',4200.50,'Pending'),
(91,'UPI',1850.00,'Completed'),
(92,'Credit Card',5750.25,'Completed'),
(93,'Debit Card',1350.75,'Completed'),
(94,'Cash',900.50,'Refunded'),
(95,'Net Banking',3450.00,'Completed'),
(96,'UPI',2500.25,'Pending'),
(97,'Credit Card',4650.50,'Completed'),
(98,'Debit Card',1125.00,'Completed'),
(99,'Cash',650.75,'Failed'),
(100,'Net Banking',5050.00,'Completed'),
(101,'UPI',1550.00,'Completed'),
(102,'Credit Card',3250.75,'Pending'),
(103,'Debit Card',950.50,'Completed'),
(104,'Cash',1250.00,'Completed'),
(105,'Net Banking',5750.25,'Refunded'),
(106,'UPI',2150.50,'Completed'),
(107,'Credit Card',4100.00,'Completed'),
(108,'Debit Card',1350.25,'Failed'),
(109,'Cash',800.75,'Completed'),
(110,'Net Banking',4650.00,'Pending'),
(111,'UPI',1750.50,'Completed'),
(112,'Credit Card',6200.00,'Completed'),
(113,'Debit Card',1050.75,'Completed'),
(114,'Cash',950.00,'Refunded'),
(115,'Net Banking',3850.25,'Completed'),
(116,'UPI',2250.00,'Pending'),
(117,'Credit Card',4950.50,'Completed'),
(118,'Debit Card',1450.75,'Completed'),
(119,'Cash',700.00,'Completed'),
(120,'Net Banking',5350.25,'Completed'),
(121,'UPI',1950.00,'Completed'),
(122,'Credit Card',3550.50,'Failed'),
(123,'Debit Card',850.25,'Pending'),
(124,'Cash',1100.00,'Completed'),
(125,'Net Banking',4750.75,'Completed'),
(126,'UPI',1650.50,'Completed'),
(127,'Credit Card',5800.00,'Refunded'),
(128,'Debit Card',1250.25,'Completed'),
(129,'Cash',750.75,'Completed'),
(130,'Net Banking',4300.50,'Pending'),
(131,'UPI',2350.00,'Completed'),
(132,'Credit Card',3900.25,'Completed'),
(133,'Debit Card',975.50,'Failed'),
(134,'Cash',850.00,'Completed'),
(135,'Net Banking',5200.75,'Completed'),
(136,'UPI',1850.25,'Pending'),
(137,'Credit Card',6450.00,'Completed'),
(138,'Debit Card',1350.50,'Completed'),
(139,'Cash',625.00,'Refunded'),
(140,'Net Banking',4050.25,'Completed'),
(141,'UPI',1550.75,'Completed'),
(142,'Credit Card',2850.00,'Completed'),
(143,'Debit Card',1150.25,'Pending'),
(144,'Cash',950.50,'Completed'),
(145,'Net Banking',5650.00,'Completed'),
(146,'UPI',2050.50,'Failed'),
(147,'Credit Card',4350.75,'Completed'),
(148,'Debit Card',1450.00,'Completed'),
(149,'Cash',725.25,'Completed'),
(150,'Net Banking',4900.50,'Pending'),
(151,'UPI',1750.00,'Completed'),
(152,'Credit Card',6150.25,'Completed'),
(153,'Debit Card',1025.50,'Refunded'),
(154,'Cash',875.00,'Completed'),
(155,'Net Banking',3750.75,'Completed'),
(156,'UPI',2250.50,'Pending'),
(157,'Credit Card',5250.00,'Completed'),
(158,'Debit Card',1350.25,'Completed'),
(159,'Cash',675.50,'Failed'),
(160,'Net Banking',4500.00,'Completed'),
(161,'UPI',1950.75,'Completed'),
(162,'Credit Card',3400.50,'Pending'),
(163,'Debit Card',925.00,'Completed'),
(164,'Cash',1050.25,'Completed'),
(165,'Net Banking',5900.75,'Refunded'),
(166,'UPI',2150.00,'Completed'),
(167,'Credit Card',4750.50,'Completed'),
(168,'Debit Card',1250.75,'Failed'),
(169,'Cash',800.00,'Completed'),
(170,'Net Banking',4150.25,'Pending'),
(171,'UPI',1650.50,'Completed'),
(172,'Credit Card',6350.00,'Completed'),
(173,'Debit Card',1100.25,'Completed'),
(174,'Cash',925.75,'Refunded'),
(175,'Net Banking',3650.50,'Completed'),
(176,'UPI',2450.00,'Pending'),
(177,'Credit Card',4950.75,'Completed'),
(178,'Debit Card',1450.50,'Completed'),
(179,'Cash',725.00,'Completed'),
(180,'Net Banking',5350.25,'Completed'),
(181,'UPI',1850.75,'Completed'),
(182,'Credit Card',3150.00,'Failed'),
(183,'Debit Card',1050.50,'Pending'),
(184,'Cash',875.25,'Completed'),
(185,'Net Banking',5750.00,'Completed'),
(186,'UPI',2150.25,'Completed'),
(187,'Credit Card',4600.50,'Refunded'),
(188,'Debit Card',1350.00,'Completed'),
(189,'Cash',650.75,'Completed'),
(190,'Net Banking',4250.25,'Pending'),
(191,'UPI',1750.50,'Completed'),
(192,'Credit Card',5950.00,'Completed'),
(193,'Debit Card',950.25,'Failed'),
(194,'Cash',1150.50,'Completed'),
(195,'Net Banking',3850.75,'Completed'),
(196,'UPI',2350.00,'Pending'),
(197,'Credit Card',5150.25,'Completed'),
(198,'Debit Card',1250.50,'Completed'),
(199,'Cash',775.00,'Refunded'),
(200,'Net Banking',4450.75,'Completed'),
(201,'UPI',1950.00,'Completed'),
(202,'Credit Card',3650.50,'Pending'),
(203,'Debit Card',875.25,'Completed'),
(204,'Cash',1050.00,'Completed'),
(205,'Net Banking',5550.75,'Completed'),
(206,'UPI',2250.25,'Failed'),
(207,'Credit Card',4250.00,'Completed'),
(208,'Debit Card',1450.75,'Completed'),
(209,'Cash',700.50,'Refunded'),
(210,'Net Banking',4800.25,'Pending'),
(211,'UPI',1650.00,'Completed'),
(212,'Credit Card',6250.50,'Completed'),
(213,'Debit Card',1150.25,'Completed'),
(214,'Cash',950.75,'Failed'),
(215,'Net Banking',3950.00,'Completed'),
(216,'UPI',2050.50,'Pending'),
(217,'Credit Card',5350.25,'Completed'),
(218,'Debit Card',1350.00,'Completed'),
(219,'Cash',675.50,'Completed'),
(220,'Net Banking',4650.75,'Refunded'),
(221,'UPI',1850.25,'Completed'),
(222,'Credit Card',3450.00,'Completed'),
(223,'Debit Card',925.50,'Pending'),
(224,'Cash',850.25,'Completed'),
(225,'Net Banking',5750.50,'Completed'),
(226,'UPI',2450.00,'Failed'),
(227,'Credit Card',4050.75,'Completed'),
(228,'Debit Card',1250.25,'Completed'),
(229,'Cash',725.50,'Refunded'),
(230,'Net Banking',4350.00,'Pending'),
(231,'UPI',1750.75,'Completed'),
(232,'Credit Card',6050.25,'Completed'),
(233,'Debit Card',1050.50,'Completed'),
(234,'Cash',975.00,'Failed'),
(235,'Net Banking',3750.25,'Completed'),
(236,'UPI',2150.50,'Pending'),
(237,'Credit Card',4950.00,'Completed'),
(238,'Debit Card',1450.25,'Completed'),
(239,'Cash',650.75,'Completed'),
(240,'Net Banking',5250.50,'Refunded'),
(241,'UPI',1950.25,'Completed'),
(242,'Credit Card',3250.75,'Completed'),
(243,'Debit Card',850.00,'Pending'),
(244,'Cash',1100.50,'Completed'),
(245,'Net Banking',5650.25,'Completed'),
(246,'UPI',2350.00,'Failed'),
(247,'Credit Card',4450.50,'Completed'),
(248,'Debit Card',1350.75,'Completed'),
(249,'Cash',725.25,'Refunded'),
(250,'Net Banking',4150.00,'Pending'),
(251,'UPI',1650.50,'Completed'),
(252,'Credit Card',5850.25,'Completed'),
(253,'Debit Card',1150.00,'Completed'),
(254,'Cash',925.50,'Failed'),
(255,'Net Banking',3950.75,'Completed'),
(256,'UPI',2250.25,'Pending'),
(257,'Credit Card',5150.50,'Completed'),
(258,'Debit Card',1250.00,'Completed'),
(259,'Cash',675.75,'Refunded'),
(260,'Net Banking',4550.25,'Completed'),
(261,'UPI',1850.50,'Completed'),
(262,'Credit Card',3450.75,'Pending'),
(263,'Debit Card',950.25,'Completed'),
(264,'Cash',875.50,'Completed'),
(265,'Net Banking',5750.00,'Completed'),
(266,'UPI',2050.75,'Failed'),
(267,'Credit Card',4250.25,'Completed'),
(268,'Debit Card',1450.50,'Completed'),
(269,'Cash',725.00,'Refunded'),
(270,'Net Banking',4850.75,'Pending'),
(271,'UPI',1750.25,'Completed'),
(272,'Credit Card',6150.50,'Completed'),
(273,'Debit Card',1050.00,'Completed'),
(274,'Cash',950.25,'Failed'),
(275,'Net Banking',3850.50,'Completed'),
(276,'UPI',2350.75,'Pending'),
(277,'Credit Card',4950.25,'Completed'),
(278,'Debit Card',1350.50,'Completed'),
(279,'Cash',650.00,'Completed'),
(280,'Net Banking',5350.75,'Refunded'),
(281,'UPI',1950.50,'Completed'),
(282,'Credit Card',3650.25,'Completed'),
(283,'Debit Card',875.75,'Pending'),
(284,'Cash',1050.00,'Completed'),
(285,'Net Banking',5650.50,'Completed'),
(286,'UPI',2150.25,'Failed'),
(287,'Credit Card',4550.75,'Completed'),
(288,'Debit Card',1250.50,'Completed'),
(289,'Cash',725.25,'Refunded'),
(290,'Net Banking',4250.00,'Pending'),
(291,'UPI',1650.75,'Completed'),
(292,'Credit Card',5950.25,'Completed'),
(293,'Debit Card',1150.50,'Completed'),
(294,'Cash',925.00,'Failed'),
(295,'Net Banking',3950.75,'Completed'),
(296,'UPI',2250.50,'Pending'),
(297,'Credit Card',5150.25,'Completed'),
(298,'Debit Card',1350.00,'Completed'),
(299,'Cash',675.50,'Refunded'),
(300,'Net Banking',4750.75,'Completed');


INSERT INTO deliveries
(partner_id, order_id, assigned_id, pickup_time, delivery_time, delivery_status)
VALUES
(1,1,101,'09:00:00','09:35:00','Delivered'),
(2,2,102,'09:10:00','09:50:00','Delivered'),
(3,3,103,'09:20:00','10:05:00','Delivered'),
(4,4,104,'09:30:00','10:15:00','Delivered'),
(5,5,105,'09:40:00','10:25:00','Delivered'),
(6,6,106,'09:50:00','10:40:00','In Transit'),
(7,7,107,'10:00:00','10:45:00','Delivered'),
(8,8,108,'10:10:00','10:55:00','Delivered'),
(9,9,109,'10:20:00','11:10:00','Delivered'),
(10,10,110,'10:30:00','11:20:00','Picked Up'),
(1,11,111,'10:40:00','11:25:00','Delivered'),
(2,12,112,'10:50:00','11:35:00','Delivered'),
(3,13,113,'11:00:00','11:45:00','Delivered'),
(4,14,114,'11:10:00','11:55:00','In Transit'),
(5,15,115,'11:20:00','12:05:00','Delivered'),
(6,16,116,'11:30:00','12:20:00','Delivered'),
(7,17,117,'11:40:00','12:25:00','Delivered'),
(8,18,118,'11:50:00','12:35:00','Picked Up'),
(9,19,119,'12:00:00','12:50:00','Delivered'),
(10,20,120,'12:10:00','13:00:00','Delivered'),
(1,21,121,'12:20:00','13:05:00','Delivered'),
(2,22,122,'12:30:00','13:20:00','Delivered'),
(3,23,123,'12:40:00','13:30:00','In Transit'),
(4,24,124,'12:50:00','13:35:00','Delivered'),
(5,25,125,'13:00:00','13:45:00','Delivered'),
(6,26,126,'13:10:00','14:00:00','Delivered'),
(7,27,127,'13:20:00','14:10:00','Delivered'),
(8,28,128,'13:30:00','14:15:00','Picked Up'),
(9,29,129,'13:40:00','14:25:00','Delivered'),
(10,30,130,'13:50:00','14:40:00','Delivered'),
(1,31,131,'14:00:00','14:45:00','Delivered'),
(2,32,132,'14:10:00','15:00:00','Delivered'),
(3,33,133,'14:20:00','15:05:00','In Transit'),
(4,34,134,'14:30:00','15:20:00','Delivered'),
(5,35,135,'14:40:00','15:25:00','Delivered'),
(6,36,136,'14:50:00','15:40:00','Delivered'),
(7,37,137,'15:00:00','15:50:00','Delivered'),
(8,38,138,'15:10:00','15:55:00','Picked Up'),
(9,39,139,'15:20:00','16:05:00','Delivered'),
(10,40,140,'15:30:00','16:20:00','Delivered'),
(1,41,141,'15:40:00','16:25:00','Delivered'),
(2,42,142,'15:50:00','16:35:00','Delivered'),
(3,43,143,'16:00:00','16:50:00','In Transit'),
(4,44,144,'16:10:00','16:55:00','Delivered'),
(5,45,145,'16:20:00','17:05:00','Delivered'),
(6,46,146,'16:30:00','17:20:00','Delivered'),
(7,47,147,'16:40:00','17:25:00','Delivered'),
(8,48,148,'16:50:00','17:35:00','Picked Up'),
(9,49,149,'17:00:00','17:50:00','Delivered'),
(10,50,150,'17:10:00','18:00:00','Delivered'),
(1,51,151,'17:20:00','18:05:00','Delivered'),
(2,52,152,'17:30:00','18:20:00','Delivered'),
(3,53,153,'17:40:00','18:30:00','In Transit'),
(4,54,154,'17:50:00','18:35:00','Delivered'),
(5,55,155,'18:00:00','18:45:00','Delivered'),
(6,56,156,'18:10:00','19:00:00','Delivered'),
(7,57,157,'18:20:00','19:10:00','Delivered'),
(8,58,158,'18:30:00','19:15:00','Picked Up'),
(9,59,159,'18:40:00','19:25:00','Delivered'),
(10,60,160,'18:50:00','19:40:00','Delivered'),
(1,61,161,'19:00:00','19:45:00','Delivered'),
(2,62,162,'19:10:00','20:00:00','Delivered'),
(3,63,163,'19:20:00','20:05:00','In Transit'),
(4,64,164,'19:30:00','20:20:00','Delivered'),
(5,65,165,'19:40:00','20:25:00','Delivered'),
(6,66,166,'19:50:00','20:40:00','Delivered'),
(7,67,167,'20:00:00','20:50:00','Delivered'),
(8,68,168,'20:10:00','20:55:00','Picked Up'),
(9,69,169,'20:20:00','21:05:00','Delivered'),
(10,70,170,'20:30:00','21:20:00','Delivered'),
(1,71,171,'20:40:00','21:25:00','Delivered'),
(2,72,172,'20:50:00','21:35:00','Delivered'),
(3,73,173,'21:00:00','21:50:00','In Transit'),
(4,74,174,'21:10:00','21:55:00','Delivered'),
(5,75,175,'21:20:00','22:05:00','Delivered'),
(6,76,176,'21:30:00','22:20:00','Delivered'),
(7,77,177,'21:40:00','22:25:00','Delivered'),
(8,78,178,'21:50:00','22:35:00','Picked Up'),
(9,79,179,'22:00:00','22:50:00','Delivered'),
(10,80,180,'22:10:00','23:00:00','Delivered'),
(1,81,181,'08:00:00','08:45:00','Delivered'),
(2,82,182,'08:10:00','08:55:00','Delivered'),
(3,83,183,'08:20:00','09:05:00','In Transit'),
(4,84,184,'08:30:00','09:20:00','Delivered'),
(5,85,185,'08:40:00','09:25:00','Delivered'),
(6,86,186,'08:50:00','09:40:00','Delivered'),
(7,87,187,'09:00:00','09:50:00','Delivered'),
(8,88,188,'09:10:00','09:55:00','Picked Up'),
(9,89,189,'09:20:00','10:05:00','Delivered'),
(10,90,190,'09:30:00','10:20:00','Delivered'),
(1,91,191,'09:40:00','10:25:00','Delivered'),
(2,92,192,'09:50:00','10:35:00','Delivered'),
(3,93,193,'10:00:00','10:50:00','In Transit'),
(4,94,194,'10:10:00','10:55:00','Delivered'),
(5,95,195,'10:20:00','11:05:00','Delivered'),
(6,96,196,'10:30:00','11:20:00','Delivered'),
(7,97,197,'10:40:00','11:25:00','Delivered'),
(8,98,198,'10:50:00','11:35:00','Picked Up'),
(9,99,199,'11:00:00','11:50:00','Delivered'),
(10,100,200,'11:10:00','12:00:00','Delivered'),
(1,101,201,'11:20:00','12:05:00','Delivered'),
(2,102,202,'11:30:00','12:20:00','Delivered'),
(3,103,203,'11:40:00','12:30:00','In Transit'),
(4,104,204,'11:50:00','12:35:00','Delivered'),
(5,105,205,'12:00:00','12:45:00','Delivered'),
(6,106,206,'12:10:00','13:00:00','Delivered'),
(7,107,207,'12:20:00','13:10:00','Delivered'),
(8,108,208,'12:30:00','13:15:00','Picked Up'),
(9,109,209,'12:40:00','13:25:00','Delivered'),
(10,110,210,'12:50:00','13:40:00','Delivered'),
(1,111,211,'13:00:00','13:45:00','Delivered'),
(2,112,212,'13:10:00','14:00:00','Delivered'),
(3,113,213,'13:20:00','14:05:00','In Transit'),
(4,114,214,'13:30:00','14:20:00','Delivered'),
(5,115,215,'13:40:00','14:25:00','Delivered'),
(6,116,216,'13:50:00','14:40:00','Delivered'),
(7,117,217,'14:00:00','14:50:00','Delivered'),
(8,118,218,'14:10:00','14:55:00','Picked Up'),
(9,119,219,'14:20:00','15:05:00','Delivered'),
(10,120,220,'14:30:00','15:20:00','Delivered'),
(1,121,221,'14:40:00','15:25:00','Delivered'),
(2,122,222,'14:50:00','15:35:00','Delivered'),
(3,123,223,'15:00:00','15:50:00','In Transit'),
(4,124,224,'15:10:00','15:55:00','Delivered'),
(5,125,225,'15:20:00','16:05:00','Delivered'),
(6,126,226,'15:30:00','16:20:00','Delivered'),
(7,127,227,'15:40:00','16:30:00','Delivered'),
(8,128,228,'15:50:00','16:35:00','Picked Up'),
(9,129,229,'16:00:00','16:45:00','Delivered'),
(10,130,230,'16:10:00','17:00:00','Delivered'),
(1,131,231,'16:20:00','17:05:00','Delivered'),
(2,132,232,'16:30:00','17:20:00','Delivered'),
(3,133,233,'16:40:00','17:30:00','In Transit'),
(4,134,234,'16:50:00','17:35:00','Delivered'),
(5,135,235,'17:00:00','17:45:00','Delivered'),
(6,136,236,'17:10:00','18:00:00','Delivered'),
(7,137,237,'17:20:00','18:10:00','Delivered'),
(8,138,238,'17:30:00','18:15:00','Picked Up'),
(9,139,239,'17:40:00','18:25:00','Delivered'),
(10,140,240,'17:50:00','18:40:00','Delivered'),
(1,141,241,'18:00:00','18:45:00','Delivered'),
(2,142,242,'18:10:00','19:00:00','Delivered'),
(3,143,243,'18:20:00','19:05:00','In Transit'),
(4,144,244,'18:30:00','19:20:00','Delivered'),
(5,145,245,'18:40:00','19:25:00','Delivered'),
(6,146,246,'18:50:00','19:40:00','Delivered'),
(7,147,247,'19:00:00','19:50:00','Delivered'),
(8,148,248,'19:10:00','19:55:00','Picked Up'),
(9,149,249,'19:20:00','20:05:00','Delivered'),
(10,150,250,'19:30:00','20:20:00','Delivered'),
(1,151,251,'19:40:00','20:25:00','Delivered'),
(2,152,252,'19:50:00','20:35:00','Delivered'),
(3,153,253,'20:00:00','20:50:00','In Transit'),
(4,154,254,'20:10:00','20:55:00','Delivered'),
(5,155,255,'20:20:00','21:05:00','Delivered'),
(6,156,256,'20:30:00','21:20:00','Delivered'),
(7,157,257,'20:40:00','21:30:00','Delivered'),
(8,158,258,'20:50:00','21:35:00','Picked Up'),
(9,159,259,'21:00:00','21:45:00','Delivered'),
(10,160,260,'21:10:00','22:00:00','Delivered'),
(1,161,261,'21:20:00','22:05:00','Delivered'),
(2,162,262,'21:30:00','22:20:00','Delivered'),
(3,163,263,'21:40:00','22:30:00','In Transit'),
(4,164,264,'21:50:00','22:35:00','Delivered'),
(5,165,265,'22:00:00','22:45:00','Delivered'),
(6,166,266,'22:10:00','23:00:00','Delivered'),
(7,167,267,'22:20:00','23:10:00','Delivered'),
(8,168,268,'22:30:00','23:15:00','Picked Up'),
(9,169,269,'22:40:00','23:25:00','Delivered'),
(10,170,270,'22:50:00','23:40:00','Delivered'),
(1,171,271,'08:00:00','08:45:00','Delivered'),
(2,172,272,'08:10:00','08:55:00','Delivered'),
(3,173,273,'08:20:00','09:05:00','In Transit'),
(4,174,274,'08:30:00','09:20:00','Delivered'),
(5,175,275,'08:40:00','09:25:00','Delivered'),
(6,176,276,'08:50:00','09:40:00','Delivered'),
(7,177,277,'09:00:00','09:50:00','Delivered'),
(8,178,278,'09:10:00','09:55:00','Picked Up'),
(9,179,279,'09:20:00','10:05:00','Delivered'),
(10,180,280,'09:30:00','10:20:00','Delivered'),
(1,181,281,'09:40:00','10:25:00','Delivered'),
(2,182,282,'09:50:00','10:35:00','Delivered'),
(3,183,283,'10:00:00','10:50:00','In Transit'),
(4,184,284,'10:10:00','10:55:00','Delivered'),
(5,185,285,'10:20:00','11:05:00','Delivered'),
(6,186,286,'10:30:00','11:20:00','Delivered'),
(7,187,287,'10:40:00','11:25:00','Delivered'),
(8,188,288,'10:50:00','11:35:00','Picked Up'),
(9,189,289,'11:00:00','11:50:00','Delivered'),
(10,190,290,'11:10:00','12:00:00','Delivered'),
(1,191,291,'11:20:00','12:05:00','Delivered'),
(2,192,292,'11:30:00','12:20:00','Delivered'),
(3,193,293,'11:40:00','12:30:00','In Transit'),
(4,194,294,'11:50:00','12:35:00','Delivered'),
(5,195,295,'12:00:00','12:45:00','Delivered'),
(6,196,296,'12:10:00','13:00:00','Delivered'),
(7,197,297,'12:20:00','13:10:00','Delivered'),
(8,198,298,'12:30:00','13:15:00','Picked Up'),
(9,199,299,'12:40:00','13:25:00','Delivered'),
(10,200,300,'12:50:00','13:40:00','Delivered'),
(1,201,301,'13:00:00','13:45:00','Delivered'),
(2,202,302,'13:10:00','14:00:00','Delivered'),
(3,203,303,'13:20:00','14:05:00','In Transit'),
(4,204,304,'13:30:00','14:20:00','Delivered'),
(5,205,305,'13:40:00','14:25:00','Delivered'),
(6,206,306,'13:50:00','14:40:00','Delivered'),
(7,207,307,'14:00:00','14:50:00','Delivered'),
(8,208,308,'14:10:00','14:55:00','Picked Up'),
(9,209,309,'14:20:00','15:05:00','Delivered'),
(10,210,310,'14:30:00','15:20:00','Delivered'),
(1,211,311,'14:40:00','15:25:00','Delivered'),
(2,212,312,'14:50:00','15:35:00','Delivered'),
(3,213,313,'15:00:00','15:50:00','In Transit'),
(4,214,314,'15:10:00','15:55:00','Delivered'),
(5,215,315,'15:20:00','16:05:00','Delivered'),
(6,216,316,'15:30:00','16:20:00','Delivered'),
(7,217,317,'15:40:00','16:30:00','Delivered'),
(8,218,318,'15:50:00','16:35:00','Picked Up'),
(9,219,319,'16:00:00','16:45:00','Delivered'),
(10,220,320,'16:10:00','17:00:00','Delivered'),
(1,221,321,'16:20:00','17:05:00','Delivered'),
(2,222,322,'16:30:00','17:20:00','Delivered'),
(3,223,323,'16:40:00','17:30:00','In Transit'),
(4,224,324,'16:50:00','17:35:00','Delivered'),
(5,225,325,'17:00:00','17:45:00','Delivered'),
(6,226,326,'17:10:00','18:00:00','Delivered'),
(7,227,327,'17:20:00','18:10:00','Delivered'),
(8,228,328,'17:30:00','18:15:00','Picked Up'),
(9,229,329,'17:40:00','18:25:00','Delivered'),
(10,230,330,'17:50:00','18:40:00','Delivered'),
(1,231,331,'18:00:00','18:45:00','Delivered'),
(2,232,332,'18:10:00','19:00:00','Delivered'),
(3,233,333,'18:20:00','19:05:00','In Transit'),
(4,234,334,'18:30:00','19:20:00','Delivered'),
(5,235,335,'18:40:00','19:25:00','Delivered'),
(6,236,336,'18:50:00','19:40:00','Delivered'),
(7,237,337,'19:00:00','19:50:00','Delivered'),
(8,238,338,'19:10:00','19:55:00','Picked Up'),
(9,239,339,'19:20:00','20:05:00','Delivered'),
(10,240,340,'19:30:00','20:20:00','Delivered'),
(1,241,341,'19:40:00','20:25:00','Delivered'),
(2,242,342,'19:50:00','20:35:00','Delivered'),
(3,243,343,'20:00:00','20:50:00','In Transit'),
(4,244,344,'20:10:00','20:55:00','Delivered'),
(5,245,345,'20:20:00','21:05:00','Delivered'),
(6,246,346,'20:30:00','21:20:00','Delivered'),
(7,247,347,'20:40:00','21:30:00','Delivered'),
(8,248,348,'20:50:00','21:35:00','Picked Up'),
(9,249,349,'21:00:00','21:45:00','Delivered'),
(10,250,350,'21:10:00','22:00:00','Delivered');

INSERT INTO coupons
(min_order_amount, discount, start_date, end_date)
VALUES
(500.00, 50.00, '2026-01-01', '2026-01-31'),
(750.00, 75.00, '2026-01-15', '2026-02-15'),
(1000.00, 100.00, '2026-02-01', '2026-02-28'),
(1200.00, 120.00, '2026-02-15', '2026-03-15'),
(1500.00, 150.00, '2026-03-01', '2026-03-31'),
(2000.00, 200.00, '2026-03-15', '2026-04-15'),
(2500.00, 250.00, '2026-04-01', '2026-04-30'),
(3000.00, 300.00, '2026-04-15', '2026-05-15'),
(3500.00, 350.00, '2026-05-01', '2026-05-31'),
(4000.00, 400.00, '2026-05-15', '2026-06-15'),
(4500.00, 450.00, '2026-06-01', '2026-06-30'),
(5000.00, 500.00, '2026-06-15', '2026-07-15'),
(600.00, 60.00, '2026-07-01', '2026-07-31'),
(800.00, 80.00, '2026-07-15', '2026-08-15'),
(1100.00, 110.00, '2026-08-01', '2026-08-31'),
(1600.00, 160.00, '2026-08-15', '2026-09-15'),
(2200.00, 220.00, '2026-09-01', '2026-09-30'),
(2800.00, 280.00, '2026-09-15', '2026-10-15'),
(3200.00, 320.00, '2026-10-01', '2026-10-31'),
(5000.00, 750.00, '2026-10-15', '2026-11-30');

 

INSERT INTO reviews
(order_id, customer_id, restaurant_id, ratng, review_txt)
VALUES
(1,1,1,5,'Excellent food'),
(2,2,1,4,'Very tasty food'),
(3,3,1,5,'Amazing experience'),
(4,4,1,4,'Good quality food'),
(5,5,1,3,'Food was okay'),
(6,6,1,5,'Loved the meal'),
(7,7,1,4,'Good service'),
(8,8,1,5,'Fresh and delicious'),
(9,9,1,4,'Nice food'),
(10,10,1,5,'Highly recommended'),
(11,11,1,4,'Good taste'),
(12,12,1,3,'Average food'),
(13,13,1,5,'Excellent meal'),
(14,14,1,4,'Good experience'),
(15,15,1,5,'Fantastic food'),
(16,16,1,4,'Fresh food'),
(17,17,1,3,'Food was decent'),
(18,18,1,5,'Very delicious'),
(19,19,1,4,'Good portion'),
(20,20,1,5,'Excellent service'),
(21,21,1,4,'Tasty meal'),
(22,22,1,5,'Amazing taste'),
(23,23,1,4,'Good quality'),
(24,24,1,5,'Very good food'),
(25,25,1,4,'Fresh and tasty'),
(26,26,1,5,'Excellent quality'),
(27,27,1,4,'Good food'),
(28,28,1,3,'Average taste'),
(29,29,1,5,'Loved the taste'),
(30,30,1,4,'Good delivery'),
(31,31,1,5,'Perfect meal'),
(32,32,1,4,'Nice experience'),
(33,33,1,5,'Very good food'),
(34,34,1,4,'Good service'),
(35,35,1,5,'Delicious meal'),
(36,36,1,4,'Fresh and tasty'),
(37,37,1,3,'Average experience'),
(38,38,1,5,'Fantastic taste'),
(39,39,1,4,'Good food'),
(40,40,1,5,'Excellent meal'),
(41,41,1,4,'Tasty food'),
(42,42,1,5,'Amazing meal'),
(43,43,1,4,'Good quality'),
(44,44,1,5,'Very delicious'),
(45,45,1,4,'Fresh and good'),
(46,46,1,5,'Excellent food'),
(47,47,1,4,'Nice taste'),
(48,48,1,3,'Food was decent'),
(49,49,1,5,'Loved the meal'),
(50,50,1,4,'Good experience'),
(51,51,1,5,'Fantastic food'),
(52,52,1,4,'Very tasty'),
(53,53,1,5,'Excellent service'),
(54,54,1,4,'Good food'),
(55,55,1,5,'Amazing taste'),
(56,56,1,4,'Nice meal'),
(57,57,1,3,'Average food'),
(58,58,1,5,'Delicious food'),
(59,59,1,4,'Good quality'),
(60,60,1,5,'Excellent experience'),
(61,61,1,4,'Very good food'),
(62,62,1,5,'Amazing food'),
(63,63,1,4,'Good meal'),
(64,64,1,5,'Excellent taste'),
(65,65,1,4,'Fresh and delicious'),
(66,66,1,5,'Fantastic meal'),
(67,67,1,4,'Good food'),
(68,68,1,3,'Average taste'),
(69,69,1,5,'Very tasty'),
(70,70,1,4,'Good service'),
(71,71,1,5,'Excellent meal'),
(72,72,1,4,'Nice food'),
(73,73,1,5,'Great experience'),
(74,74,1,4,'Good quality'),
(75,75,1,5,'Highly recommended'),
(76,76,1,4,'Tasty food'),
(77,77,1,3,'Food was okay'),
(78,78,1,5,'Amazing food'),
(79,79,1,4,'Good portion'),
(80,80,1,5,'Excellent service'),
(81,81,1,4,'Good food'),
(82,82,1,5,'Very delicious'),
(83,83,1,4,'Fresh food'),
(84,84,1,5,'Amazing taste'),
(85,85,1,4,'Good meal'),
(86,86,1,5,'Excellent quality'),
(87,87,1,4,'Tasty food'),
(88,88,1,3,'Food was average'),
(89,89,1,5,'Loved the taste'),
(90,90,1,4,'Good delivery'),
(91,91,1,5,'Perfect meal'),
(92,92,1,4,'Nice experience'),
(93,93,1,5,'Very good food'),
(94,94,1,4,'Good service'),
(95,95,1,5,'Delicious meal'),
(96,96,1,4,'Fresh and tasty'),
(97,97,1,3,'Average experience'),
(98,98,1,5,'Fantastic taste'),
(99,99,1,4,'Good food'),
(100,100,1,5,'Excellent meal');

drop table reviews;
show tables;
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    rating INT NOT NULL,
    review_txt VARCHAR(500),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants(restaurant_id)
);

INSERT INTO reviews
(order_id, customer_id, restaurant_id, rating, review_txt)
VALUES
(1,1,1,5,'Excellent food and service'),
(2,2,2,4,'Food was tasty'),
(3,3,3,5,'Very delicious and fresh'),
(4,4,4,3,'Food was average'),
(5,5,5,4,'Good quality food'),
(6,6,6,5,'Amazing experience'),
(7,7,7,4,'Nice food and quick delivery'),
(8,8,8,3,'Food was okay'),
(9,9,9,5,'Loved the food'),
(10,10,10,4,'Very good taste'),
(11,11,11,5,'Excellent restaurant'),
(12,12,12,3,'Average experience'),
(13,13,13,4,'Good food'),
(14,14,14,5,'Fantastic taste'),
(15,15,15,4,'Really enjoyed the meal');

-- 1. Retrieve all customers
SELECT * FROM customers;

-- 2. Find customers from a particular city (Mumbai)
SELECT * FROM customers 
WHERE address LIKE '%Mumbai%';

-- 3. Find unique cities extracted from address
SELECT DISTINCT TRIM(SUBSTRING_INDEX(address, ',', -1)) AS city 
FROM customers;

-- 4. Display restaurants by rating (highest first, using reviews)
SELECT r.restaurant_id, r.owner_name, ROUND(AVG(rv.rating), 2) AS avg_rating
FROM restaurants r
LEFT JOIN reviews rv ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id, r.owner_name
ORDER BY avg_rating DESC;

-- 5. Display the top 5 restaurants
SELECT r.restaurant_id, r.owner_name, ROUND(AVG(rv.rating), 2) AS avg_rating
FROM restaurants r
LEFT JOIN reviews rv ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id, r.owner_name
ORDER BY avg_rating DESC
LIMIT 5;

-- 6. Give a temporary name to columns
SELECT 
    customer_id AS ID, 
    CONCAT(first_name, ' ', last_name) AS customer_name,
    TRIM(SUBSTRING_INDEX(address, ',', -1)) AS customer_city 
FROM customers;

-- 7. Find restaurants with rating greater than 4.5
SELECT r.restaurant_id, r.owner_name, ROUND(AVG(rv.rating), 2) AS avg_rating
FROM restaurants r
JOIN reviews rv ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id, r.owner_name
HAVING AVG(rv.rating) > 4.5;

-- 8. Find orders where total amount is between 500 and 1500
SELECT * FROM orders
WHERE total_cost BETWEEN 500 AND 1500;

-- 9. Find customers from selected cities (Mumbai, Pune, Thane)
SELECT * FROM customers
WHERE address REGEXP 'Mumbai|Pune|Thane';

-- 10. Find food items whose names contain "Pizza"
SELECT * FROM menu_items 
WHERE item_name LIKE '%Pizza%';

-- 11. Find orders that have not been delivered
SELECT * FROM orders
WHERE order_status <> 'Delivered';

-- 12. How many customers are registered?
SELECT COUNT(*) AS total_registered_customers FROM customers;

-- 13. What is the total revenue?
SELECT SUM(total_cost) AS total_revenue FROM orders;

-- 14. What is the average order value?
SELECT ROUND(AVG(total_cost), 2) AS avg_order_value FROM orders;

-- 15. What is the highest order amount?
SELECT MAX(total_cost) AS highest_order_cost FROM orders;

-- 16. What is the lowest menu item price?
SELECT MIN(price) AS lowest_item_price FROM menu_items;

-- 17. How many orders have been delivered?
SELECT COUNT(*) AS delivered_orders FROM orders
WHERE order_status = 'Delivered';

-- 18. How many restaurants are available in each city?
SELECT 
    TRIM(SUBSTRING_INDEX(address, ',', -1)) AS city, 
    COUNT(*) AS restaurant_count 
FROM restaurants
GROUP BY TRIM(SUBSTRING_INDEX(address, ',', -1));

-- 19. Find total orders per restaurant
SELECT restaurant_id, COUNT(order_id) AS total_orders 
FROM orders
GROUP BY restaurant_id;

-- 20. Find revenue generated by each restaurant
SELECT restaurant_id, SUM(total_cost) AS total_revenue 
FROM orders 
GROUP BY restaurant_id;

-- 21. Find number of customers in each city
SELECT 
    TRIM(SUBSTRING_INDEX(address, ',', -1)) AS city, 
    COUNT(customer_id) AS customer_count 
FROM customers
GROUP BY TRIM(SUBSTRING_INDEX(address, ',', -1));

-- 22. Find average order value for each restaurant
SELECT restaurant_id, ROUND(AVG(total_cost), 2) AS avg_order_value 
FROM orders
GROUP BY restaurant_id;

-- 23. Find total sales for each food category
SELECT 
    fc.categorie_name AS food_category, 
    SUM(i.amount) AS total_sales 
FROM items i
JOIN menu_items m ON i.item_id = m.item_id
JOIN food_categories fc ON m.categorie_id = fc.categorie_id
GROUP BY fc.categorie_name;

-- 24. Find number of orders handled by each delivery partner
SELECT partner_id, COUNT(order_id) AS orders_handled 
FROM orders
GROUP BY partner_id;

-- 25. Find restaurants having more than 20 orders
SELECT r.restaurant_id, r.owner_name, COUNT(o.order_id) AS total_orders 
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.owner_name
HAVING COUNT(o.order_id) > 20;

-- 26. Find restaurants generating revenue greater than 10,000
SELECT r.restaurant_id, r.owner_name, SUM(o.total_cost) AS total_revenue 
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.owner_name
HAVING SUM(o.total_cost) > 10000;

-- 27. Find delivery partners who completed more than 5 deliveries
SELECT partner_id, COUNT(delivery_id) AS completed_deliveries 
FROM deliveries
WHERE delivery_status = 'Delivered'
GROUP BY partner_id
HAVING COUNT(delivery_id) > 5;

-- 28. Find food categories generating revenue above 1000
SELECT 
    fc.categorie_name AS food_category, 
    SUM(i.amount) AS total_revenue 
FROM items i
JOIN menu_items m ON i.item_id = m.item_id
JOIN food_categories fc ON m.categorie_id = fc.categorie_id
GROUP BY fc.categorie_name
HAVING SUM(i.amount) > 1000;

-- 29. Find all customers, including customers who have never placed an order
SELECT 
    c.customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    o.order_id, 
    o.total_cost, 
    o.order_status 
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- 30. Find all restaurants and their corresponding orders
SELECT 
    r.restaurant_id, 
    r.owner_name, 
    o.order_id, 
    o.total_cost, 
    o.order_status 
FROM orders o
RIGHT JOIN restaurants r ON o.restaurant_id = r.restaurant_id;

-- 31. Generate all possible combinations of restaurants and food categories
SELECT r.owner_name, fc.categorie_name 
FROM restaurants r
CROSS JOIN food_categories fc;

-- 32. Find monthly revenue
SELECT MONTHNAME(order_date) AS month, SUM(total_cost) AS monthly_revenue 
FROM orders
GROUP BY MONTHNAME(order_date);

-- 33. Find yearly revenue
SELECT YEAR(order_date) AS year, SUM(total_cost) AS yearly_revenue 
FROM orders
GROUP BY YEAR(order_date);

-- 34. Find orders placed on weekends
SELECT * FROM orders
WHERE DAYOFWEEK(order_date) IN (1, 7);

-- 35. Find customers registered in a particular year (e.g., 2025)
SELECT * FROM customers
WHERE YEAR(registration_date) = 2025;

-- 36. Inspect deliveries data
SELECT delivery_id, order_id, partner_id, delivery_status, pickup_time, delivery_time 
FROM deliveries;

-- 37. Find the average delivery duration in minutes
SELECT ROUND(AVG(TIMESTAMPDIFF(MINUTE, pickup_time, delivery_time)), 2) AS avg_delivery_minutes 
FROM deliveries
WHERE delivery_status = 'Delivered';

-- 38. Generate full customer names using CONCAT()
SELECT customer_id, CONCAT(first_name, ' ', last_name) AS full_name 
FROM customers;

-- 39. Display restaurant owner names in uppercase using UPPER()
SELECT owner_name, UPPER(owner_name) AS uppercase_owner_name 
FROM restaurants;

-- 40. Generate formatted customer information
SELECT CONCAT(first_name, ' ', last_name, ' | Address: ', address, ' | Phone: ', phone) AS customer_profile 
FROM customers;

-- 41. Extract username portion from email address
SELECT email, SUBSTRING_INDEX(email, '@', 1) AS email_username 
FROM customers;

-- 42. LOWER()
SELECT owner_name, LOWER(owner_name) AS lowercase_name 
FROM restaurants;

-- 43. LENGTH()
SELECT owner_name, LENGTH(owner_name) AS name_length 
FROM restaurants;

-- 44. SUBSTRING()
SELECT owner_name, SUBSTRING(owner_name, 1, 5) AS first_five_characters 
FROM restaurants;

-- 45. TRIM()
SELECT first_name, TRIM(first_name) AS clean_first_name 
FROM customers;

-- 46. Display rounded order values
SELECT order_id, total_cost, ROUND(total_cost) AS rounded_order_value 
FROM orders;

-- 47. Round order amount upward
SELECT order_id, total_cost, CEIL(total_cost) AS ceil_value 
FROM orders;

-- 48. Round order amount downward
SELECT order_id, total_cost, FLOOR(total_cost) AS floor_value 
FROM orders;

-- 49. ABS() Calculate absolute difference from 500
SELECT order_id, total_cost, ABS(total_cost - 500) AS abs_difference 
FROM orders;

-- 50. MOD() Find remainder when order ID is divided by 2
SELECT order_id, MOD(order_id, 2) AS remainder 
FROM orders;

-- 51. POWER() Example calculation using quantity
SELECT item_id, quantity, POWER(quantity, 2) AS quantity_square 
FROM items;

-- 52. Discount calculation (10%)
SELECT 
    order_id, 
    total_cost, 
    ROUND(total_cost * 0.10, 2) AS discount_amount, 
    ROUND(total_cost * 0.90, 2) AS final_amount
FROM orders;

-- 53. Delivery charge calculation (Flat 40 delivery charge)
SELECT 
    order_id, 
    total_cost, 
    40 AS delivery_fee, 
    total_cost + 40 AS final_payable_amount
FROM orders;

-- 54. Find restaurants whose average rating is greater than overall average rating
SELECT r.restaurant_id, r.owner_name, ROUND(AVG(rv.rating), 2) AS avg_rating
FROM restaurants r
JOIN reviews rv ON r.restaurant_id = rv.restaurant_id
GROUP BY r.restaurant_id, r.owner_name
HAVING AVG(rv.rating) > (SELECT AVG(rating) FROM reviews);

-- 55. Find customers who placed orders at restaurants located in Mumbai
SELECT customer_id, first_name, last_name, address 
FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders
    WHERE restaurant_id IN (
        SELECT restaurant_id FROM restaurants WHERE address LIKE '%Mumbai%'
    )
);

-- 56. Find customers whose spending is greater than average customer spending
SELECT 
    c.customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    SUM(o.total_cost) AS total_spending
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(o.total_cost) > (
    SELECT AVG(customer_spending) 
    FROM (
        SELECT SUM(total_cost) AS customer_spending 
        FROM orders 
        GROUP BY customer_id
    ) AS spending_data
);

-- 57. Calculate total orders for each customer using subquery
SELECT 
    c.customer_id, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    (SELECT COUNT(*) FROM orders o WHERE o.customer_id = c.customer_id) AS total_orders 
FROM customers c;

-- 58. Create a derived table containing customer-level revenue
SELECT * FROM (
    SELECT customer_id, SUM(total_cost) AS customer_revenue 
    FROM orders
    GROUP BY customer_id
) AS customer_revenue_data;

-- 59. Find restaurants whose revenue is greater than average restaurant revenue
SELECT r.restaurant_id, r.owner_name, SUM(o.total_cost) AS total_revenue
FROM restaurants r
JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.owner_name
HAVING SUM(o.total_cost) > (
    SELECT AVG(restaurant_revenue) 
    FROM (
        SELECT SUM(total_cost) AS restaurant_revenue
        FROM orders 
        GROUP BY restaurant_id
    ) AS revenue_data
);

-- 60. Customers who have placed at least one order
SELECT * FROM customers c
WHERE EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

-- 61. Customers who have never placed an order
SELECT * FROM customers c
WHERE NOT EXISTS (SELECT 1 FROM orders o WHERE o.customer_id = c.customer_id);

-- 62. Restaurants that have received reviews
SELECT * FROM restaurants r
WHERE EXISTS (SELECT 1 FROM reviews rv WHERE rv.restaurant_id = r.restaurant_id);

-- 63. Restaurants that have never received a review
SELECT * FROM restaurants r
WHERE NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.restaurant_id = r.restaurant_id);

-- 64. Review ratings higher than ANY rating given to Mumbai restaurants
SELECT DISTINCT r.restaurant_id, r.owner_name, rv.rating
FROM restaurants r
JOIN reviews rv ON r.restaurant_id = rv.restaurant_id
WHERE rv.rating > ANY (
    SELECT rv2.rating 
    FROM reviews rv2
    JOIN restaurants r2 ON rv2.restaurant_id = r2.restaurant_id
    WHERE r2.address LIKE '%Mumbai%'
);

-- 65. Review ratings higher than ALL ratings given to Mumbai restaurants
SELECT DISTINCT r.restaurant_id, r.owner_name, rv.rating
FROM restaurants r
JOIN reviews rv ON r.restaurant_id = rv.restaurant_id
WHERE rv.rating > ALL (
    SELECT rv2.rating 
    FROM reviews rv2
    JOIN restaurants r2 ON rv2.restaurant_id = r2.restaurant_id
    WHERE r2.address LIKE '%Mumbai%'
);

-- 66. Transaction: Insert order, line item, and payment
START TRANSACTION;

INSERT INTO orders (customer_id, restaurant_id, partner_id, order_date, delivery_address, order_status, total_cost)
VALUES (1, 1, 1, CURDATE(), '12 MG Road, Mumbai', 'Placed', 320.00);

SET @new_order_id = LAST_INSERT_ID();

INSERT INTO items (order_id, item_id, quantity, amount)
VALUES (@new_order_id, 1, 1, 320.00);

INSERT INTO payments (order_id, payment_method, amount, payment_status)
VALUES (@new_order_id, 'UPI', 320.00, 'Completed');

COMMIT;

-- 67. View 1: Customer Order Details
CREATE OR REPLACE VIEW customer_order_details AS
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_id,
    r.owner_name AS restaurant_owner,
    o.total_cost,
    o.order_date,
    o.order_status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN restaurants r ON o.restaurant_id = r.restaurant_id;

SELECT * FROM customer_order_details;

-- 68. View 2: Restaurant Performance
CREATE OR REPLACE VIEW restaurant_performance AS
SELECT
    r.restaurant_id,
    r.owner_name,
    COUNT(o.order_id) AS total_orders,
    COALESCE(SUM(o.total_cost), 0) AS total_revenue,
    COALESCE(ROUND(AVG(o.total_cost), 2), 0) AS average_order_value,
    (SELECT ROUND(AVG(rating), 2) FROM reviews rv WHERE rv.restaurant_id = r.restaurant_id) AS average_rating
FROM restaurants r
LEFT JOIN orders o ON r.restaurant_id = o.restaurant_id
GROUP BY r.restaurant_id, r.owner_name;

SELECT * FROM restaurant_performance;

-- 69. View 3: Delivery Partner Performance
CREATE OR REPLACE VIEW delivery_partner_performance AS
SELECT
    partner_id,
    COUNT(order_id) AS total_deliveries,
    ROUND(AVG(TIMESTAMPDIFF(MINUTE, pickup_time, delivery_time)), 2) AS avg_delivery_minutes
FROM deliveries
WHERE delivery_status = 'Delivered'
GROUP BY partner_id;

SELECT * FROM delivery_partner_performance;

-- 70. Procedure 1: Place an Order
DELIMITER //
DROP PROCEDURE IF EXISTS PlaceOrder //
CREATE PROCEDURE PlaceOrder(
    IN p_customer_id INT,
    IN p_restaurant_id INT,
    IN p_partner_id INT,
    IN p_delivery_address VARCHAR(200),
    IN p_total_cost DECIMAL(10,2)
)
BEGIN
    INSERT INTO orders (customer_id, restaurant_id, partner_id, order_date, delivery_address, order_status, total_cost)
    VALUES (p_customer_id, p_restaurant_id, p_partner_id, CURDATE(), p_delivery_address, 'Placed', p_total_cost);
END //
DELIMITER ;

CALL PlaceOrder(1, 1, 1, '12 MG Road, Mumbai', 500.00);

-- 71. Procedure 2: Customer Spending Report
DELIMITER //
DROP PROCEDURE IF EXISTS CustomerSpendingReport //
CREATE PROCEDURE CustomerSpendingReport(
    IN p_customer_id INT
)
BEGIN
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COUNT(o.order_id) AS total_orders,
        COALESCE(SUM(o.total_cost), 0) AS total_spending
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name;
END //
DELIMITER ;

CALL CustomerSpendingReport(1);

-- 72. Function 1: Calculate Delivery Charge
DELIMITER //
DROP FUNCTION IF EXISTS CalculateDeliveryCharge //
CREATE FUNCTION CalculateDeliveryCharge(distance DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE charge DECIMAL(10,2);
    IF distance <= 5 THEN
        SET charge = 30.00;
    ELSEIF distance <= 10 THEN
        SET charge = 50.00;
    ELSE
        SET charge = 80.00;
    END IF;
    RETURN charge;
END //
DELIMITER ;

SELECT CalculateDeliveryCharge(7);

-- 73. Function 2: Customer Category Based on Spending
DELIMITER //
DROP FUNCTION IF EXISTS CustomerCategory //
CREATE FUNCTION CustomerCategory(spending DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE category VARCHAR(20);
    IF spending < 5000 THEN
        SET category = 'Low';
    ELSEIF spending < 15000 THEN
        SET category = 'Medium';
    ELSE
        SET category = 'High';
    END IF;
    RETURN category;
END //
DELIMITER ;

SELECT
    customer_id,
    SUM(total_cost) AS total_spending,
    CustomerCategory(SUM(total_cost)) AS customer_category
FROM orders
GROUP BY customer_id;

-- 74. Trigger 1: Update Order Total on Item Insert
DELIMITER //
DROP TRIGGER IF EXISTS update_order_total //
CREATE TRIGGER update_order_total
AFTER INSERT ON items
FOR EACH ROW
BEGIN
    UPDATE orders
    SET total_cost = (
        SELECT COALESCE(SUM(amount), 0)
        FROM items
        WHERE order_id = NEW.order_id
    )
    WHERE order_id = NEW.order_id;
END //
DELIMITER ;

-- 75. Trigger 2: Update Order Status After Payment
DELIMITER //
DROP TRIGGER IF EXISTS update_order_status_after_payment //
CREATE TRIGGER update_order_status_after_payment
AFTER INSERT ON payments
FOR EACH ROW
BEGIN
    IF NEW.payment_status = 'Completed' THEN
        UPDATE orders
        SET order_status = 'Confirmed'
        WHERE order_id = NEW.order_id;
    END IF;
END //
DELIMITER ;

-- 76. Trigger 3: Validate Review Rating
DELIMITER //
DROP TRIGGER IF EXISTS validate_review_rating //
CREATE TRIGGER validate_review_rating
BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
    IF NEW.rating < 1 OR NEW.rating > 5 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Rating must be between 1 and 5';
    END IF;
END //
DELIMITER ;

-- 77. Event: Expire Active Coupons
-- Prerequisites: Add status column so the query can execute
ALTER TABLE coupons ADD COLUMN IF NOT EXISTS status VARCHAR(20) DEFAULT 'Active';

SET GLOBAL event_scheduler = ON;
DROP EVENT IF EXISTS update_coupon_status;
CREATE EVENT update_coupon_status
ON SCHEDULE EVERY 1 DAY
DO
    UPDATE coupons
    SET status = 'Expired'
    WHERE end_date < CURDATE();

-- 78. ROW_NUMBER(): Assign serial numbers to orders
SELECT 
    order_id, 
    customer_id, 
    total_cost,
    ROW_NUMBER() OVER (ORDER BY order_id) AS row_num 
FROM orders;

-- 79. RANK(): Rank orders by total cost (ties produce gap)
SELECT 
    order_id, 
    customer_id, 
    total_cost, 
    RANK() OVER (ORDER BY total_cost DESC) AS order_rank 
FROM orders;

-- 80. DENSE_RANK(): Rank orders without skipping numbers
SELECT 
    order_id, 
    customer_id, 
    total_cost, 
    DENSE_RANK() OVER (ORDER BY total_cost DESC) AS order_dense_rank 
FROM orders;

-- 81. LAG(): Compare with previous order amount
SELECT 
    order_id, 
    total_cost, 
    LAG(total_cost) OVER (ORDER BY order_id) AS previous_order_cost 
FROM orders;

-- 82. LEAD(): Compare with next order amount
SELECT 
    order_id, 
    total_cost, 
    LEAD(total_cost) OVER (ORDER BY order_id) AS next_order_cost 
FROM orders;

-- ANALYTICS REPORT
SELECT COUNT(*) AS total_customers FROM customers;

SELECT COUNT(*) AS total_orders FROM orders;

SELECT SUM(total_cost) AS total_revenue FROM orders;

SELECT ROUND(AVG(total_cost), 2) AS average_order_value FROM orders;

SELECT COUNT(*) AS delivered_orders FROM orders
WHERE order_status = 'Delivered';