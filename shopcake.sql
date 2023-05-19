CREATE TABLE django_migrations (
  id INT PRIMARY KEY,
  app VARCHAR(255),
  name VARCHAR(255),
  applied DATETIME
);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2023-04-26 09:07:51.842756');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2023-04-26 09:07:51.875377');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2023-04-26 09:07:51.903907');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2023-04-26 09:07:51.933626');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2023-04-26 09:07:51.956904');
INSERT INTO django_migrations VALUES(6,'contenttypes','0002_remove_content_type_name','2023-04-26 09:07:52.001705');
INSERT INTO django_migrations VALUES(7,'auth','0002_alter_permission_name_max_length','2023-04-26 09:07:52.026043');
INSERT INTO django_migrations VALUES(8,'auth','0003_alter_user_email_max_length','2023-04-26 09:07:52.062994');
INSERT INTO django_migrations VALUES(9,'auth','0004_alter_user_username_opts','2023-04-26 09:07:52.083028');
INSERT INTO django_migrations VALUES(10,'auth','0005_alter_user_last_login_null','2023-04-26 09:07:52.111983');
INSERT INTO django_migrations VALUES(11,'auth','0006_require_contenttypes_0002','2023-04-26 09:07:52.128710');
INSERT INTO django_migrations VALUES(12,'auth','0007_alter_validators_add_error_messages','2023-04-26 09:07:52.145078');
INSERT INTO django_migrations VALUES(13,'auth','0008_alter_user_username_max_length','2023-04-26 09:07:52.173961');
INSERT INTO django_migrations VALUES(14,'auth','0009_alter_user_last_name_max_length','2023-04-26 09:07:52.199880');
INSERT INTO django_migrations VALUES(15,'auth','0010_alter_group_name_max_length','2023-04-26 09:07:52.237406');
INSERT INTO django_migrations VALUES(16,'auth','0011_update_proxy_permissions','2023-04-26 09:07:52.267957');
INSERT INTO django_migrations VALUES(17,'auth','0012_alter_user_first_name_max_length','2023-04-26 09:07:52.304413');
INSERT INTO django_migrations VALUES(18,'sessions','0001_initial','2023-04-26 09:07:52.340121');
CREATE TABLE auth_group (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(150) NOT NULL UNIQUE
);
CREATE TABLE auth_user (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  password varchar(128) NOT NULL,
  last_login datetime NULL,
  is_superuser bool NOT NULL,
  username varchar(150) NOT NULL UNIQUE,
  first_name varchar(150) NOT NULL,
  last_name varchar(150) NOT NULL,
  email varchar(254) NOT NULL,
  is_staff bool NOT NULL,
  is_active bool NOT NULL,
  date_joined datetime NOT NULL
);
INSERT INTO auth_user VALUES(1,'pbkdf2_sha256$390000$Xm8XSCTx6hxyvWlBcEBoPX$YdGffJNgbcgA5ZGreyfMG1xjMqe8NGMCnlUJtiMkolE=','2023-04-30 14:14:09.244281',1,'trung','','','admin@gmail.com',1,1,'2023-04-26 09:09:58.707549');
INSERT INTO auth_user VALUES(2,'pbkdf2_sha256$390000$BiWXUyQ6LReDjBZ8FO9MqY$WHxd/qxLPXwTHCwJ8FRqG0G7PxjpmP426EufJyXnnuc=','2023-04-30 11:44:28.779264',1,'phongadmin','','','phongfa@gmail.com',1,1,'2023-04-30 11:43:03.684300');
INSERT INTO auth_user VALUES(3,'pbkdf2_sha256$390000$Aiwd1HiWUzCb8ksFC4WznF$pcmso7dBNJ0calOgx/wP5/MBph4g6McHsXQOFs/0rXY=',NULL,1,'thai','','','thai@gmail.com',1,1,'2023-05-03 09:26:42.082507');
INSERT INTO auth_user VALUES(4,'pbkdf2_sha256$390000$ewyVQ5cfXlHIgWG77rbWp1$1fVDdX83n/DYjHxx1x1JE0utWP2gnZ612j7sQu9sjoY=','2023-05-03 09:27:43.419896',1,'admin','','','admin@gmail.com',1,1,'2023-05-03 09:27:01.325023');
INSERT INTO auth_user VALUES(5,'pbkdf2_sha256$390000$UCnRVQUjvNknsPN1kyiGmG$Jl2V97+Ddq8mNoPDcTXKxsHqwemmQxg0dZZYZCRsrFg=','2023-05-03 09:47:51.592481',0,'thai1','','','thai1@gmail.com',0,1,'2023-05-03 09:32:32.399137');

CREATE TABLE django_content_type (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  app_label varchar(100) NOT NULL, 
  model varchar(100) NOT NULL
);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(4,'auth','user');
INSERT INTO django_content_type VALUES(10,'cakeshop','bill');
INSERT INTO django_content_type VALUES(8,'cakeshop','cake');
INSERT INTO django_content_type VALUES(7,'cakeshop','category');
INSERT INTO django_content_type VALUES(9,'cakeshop','order');
INSERT INTO django_content_type VALUES(5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'sessions','session');
CREATE TABLE auth_permission (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  content_type_id integer NOT NULL REFERENCES django_content_type (id)     , 
  codename varchar(100) NOT NULL, 
  name varchar(255) NOT NULL
);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES(14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES(15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES(22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES(23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES(25,7,'add_category','Can add category');
INSERT INTO auth_permission VALUES(26,7,'change_category','Can change category');
INSERT INTO auth_permission VALUES(27,7,'delete_category','Can delete category');
INSERT INTO auth_permission VALUES(28,7,'view_category','Can view category');
INSERT INTO auth_permission VALUES(29,8,'add_cake','Can add cake');
INSERT INTO auth_permission VALUES(30,8,'change_cake','Can change cake');
INSERT INTO auth_permission VALUES(31,8,'delete_cake','Can delete cake');
INSERT INTO auth_permission VALUES(32,8,'view_cake','Can view cake');
INSERT INTO auth_permission VALUES(33,9,'add_order','Can add order');
INSERT INTO auth_permission VALUES(34,9,'change_order','Can change order');
INSERT INTO auth_permission VALUES(35,9,'delete_order','Can delete order');
INSERT INTO auth_permission VALUES(36,9,'view_order','Can view order');
INSERT INTO auth_permission VALUES(37,10,'add_bill','Can add bill');
INSERT INTO auth_permission VALUES(38,10,'change_bill','Can change bill');
INSERT INTO auth_permission VALUES(39,10,'delete_bill','Can delete bill');
INSERT INTO auth_permission VALUES(40,10,'view_bill','Can view bill');

CREATE TABLE auth_group_permissions (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  group_id int NOT NULL,
  permission_id int NOT NULL,
  FOREIGN KEY (group_id) REFERENCES auth_group (id),
  FOREIGN KEY (permission_id) REFERENCES auth_permission (id)
);
CREATE TABLE auth_user_groups (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  user_id integer NOT NULL REFERENCES auth_user (id)     , 
  group_id integer NOT NULL REFERENCES auth_group (id)     
  );
CREATE TABLE auth_user_user_permissions (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY, 
user_id integer NOT NULL REFERENCES auth_user (id)     , 
permission_id integer NOT NULL REFERENCES auth_permission (id)     
);
CREATE TABLE django_admin_log (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  object_id text NULL,
  object_repr varchar(200) NOT NULL,
  action_flag smallint unsigned NOT NULL CHECK (action_flag >= 0),
  change_message text NOT NULL,
  content_type_id integer NULL,
  user_id integer NOT NULL,
  action_time datetime NOT NULL,
  FOREIGN KEY (content_type_id) REFERENCES django_content_type (id)     ,
  FOREIGN KEY (user_id) REFERENCES auth_user (id)     
);
INSERT INTO django_admin_log VALUES(1,'1','bánh kem',1,'[{"added": {}}]',7,1,'2023-04-26 09:12:21.637981');
INSERT INTO django_admin_log VALUES(2,'1','bánh kem socola',1,'[{"added": {}}]',8,1,'2023-04-26 09:14:20.070977');
INSERT INTO django_admin_log VALUES(3,'2','Bánh táo',1,'[{"added": {}}]',8,1,'2023-04-29 13:05:05.413967');
INSERT INTO django_admin_log VALUES(4,'2','mochi',1,'[{"added": {}}]',7,2,'2023-04-30 11:56:37.988846');
INSERT INTO django_admin_log VALUES(5,'3','tiramisu',1,'[{"added": {}}]',7,2,'2023-04-30 11:57:06.835170');
INSERT INTO django_admin_log VALUES(6,'4','Macaron',1,'[{"added": {}}]',7,2,'2023-04-30 11:57:29.816742');
INSERT INTO django_admin_log VALUES(7,'5','Sachertorte',1,'[{"added": {}}]',7,2,'2023-04-30 11:58:24.353183');
INSERT INTO django_admin_log VALUES(8,'6','Pavlova',1,'[{"added": {}}]',7,2,'2023-04-30 11:58:43.126667');
INSERT INTO django_admin_log VALUES(9,'3','Daifuku',1,'[{"added": {}}]',8,2,'2023-04-30 12:02:18.928681');
INSERT INTO django_admin_log VALUES(10,'4','Ichigo Daifuku',1,'[{"added": {}}]',8,2,'2023-04-30 12:04:21.162420');
INSERT INTO django_admin_log VALUES(11,'5','Kusa mochi',1,'[{"added": {}}]',8,2,'2023-04-30 12:05:49.021164');
INSERT INTO django_admin_log VALUES(12,'6','Mochi Ice Cream',1,'[{"added": {}}]',8,2,'2023-04-30 12:06:37.194307');
INSERT INTO django_admin_log VALUES(13,'7','Oshiruko',1,'[{"added": {}}]',8,2,'2023-04-30 12:07:36.724039');
INSERT INTO django_admin_log VALUES(14,'8','Tiramisu cheese pancake',1,'[{"added": {}}]',8,2,'2023-04-30 12:09:43.991431');
INSERT INTO django_admin_log VALUES(15,'9','Traditional tiramisu',1,'[{"added": {}}]',8,2,'2023-04-30 12:10:40.695284');
INSERT INTO django_admin_log VALUES(16,'10','Tiramisu matcha green tea',1,'[{"added": {}}]',8,2,'2023-04-30 12:11:29.101492');
INSERT INTO django_admin_log VALUES(17,'11','Mango Tiramisu',1,'[{"added": {}}]',8,2,'2023-04-30 12:13:04.742483');
INSERT INTO django_admin_log VALUES(18,'12','Strawberry Tiramisu',1,'[{"added": {}}]',8,2,'2023-04-30 12:14:14.107173');
INSERT INTO django_admin_log VALUES(19,'11','Mango Tiramisu',2,'[{"changed": {"fields": ["Image url"]}}]',8,2,'2023-04-30 12:15:01.337345');
INSERT INTO django_admin_log VALUES(20,'13','Nutella macarons',1,'[{"added": {}}]',8,2,'2023-04-30 13:12:47.570965');
INSERT INTO django_admin_log VALUES(21,'14','Coconut macaro',1,'[{"added": {}}]',8,2,'2023-04-30 13:14:54.524175');
INSERT INTO django_admin_log VALUES(22,'15','Matcha Macaro',1,'[{"added": {}}]',8,2,'2023-04-30 13:16:15.218419');
INSERT INTO django_admin_log VALUES(23,'16','Macaro Lemon Mint',1,'[{"added": {}}]',8,2,'2023-04-30 13:17:12.440742');
INSERT INTO django_admin_log VALUES(24,'17','Classic Sachertorte',1,'[{"added": {}}]',8,2,'2023-04-30 13:40:01.462860');
INSERT INTO django_admin_log VALUES(25,'18','Sachertorte orange flavor',1,'[{"added": {}}]',8,2,'2023-04-30 13:43:29.772340');
INSERT INTO django_admin_log VALUES(26,'19','Strawberry Sachertorte',1,'[{"added": {}}]',8,2,'2023-04-30 13:46:15.628974');
INSERT INTO django_admin_log VALUES(27,'20','Cashew Sachertorte',1,'[{"added": {}}]',8,2,'2023-04-30 13:47:57.573058');
INSERT INTO django_admin_log VALUES(28,'21','Classic Pavlova',1,'[{"added": {}}]',8,2,'2023-04-30 13:51:42.865656');
INSERT INTO django_admin_log VALUES(29,'22','Pavlova with passion fruit',1,'[{"added": {}}]',8,2,'2023-04-30 13:52:55.144032');
INSERT INTO django_admin_log VALUES(30,'23','Pavlova Strawberry Flavor',1,'[{"added": {}}]',8,2,'2023-04-30 13:54:05.386833');
INSERT INTO django_admin_log VALUES(31,'24','Pavlova Caramel',1,'[{"added": {}}]',8,2,'2023-04-30 13:55:54.068631');
INSERT INTO django_admin_log VALUES(32,'25','Pavlova Chocolate Flavor',1,'[{"added": {}}]',8,2,'2023-04-30 13:56:53.960591');
INSERT INTO django_admin_log VALUES(33,'2','Bánh táo',3,'',8,1,'2023-04-30 14:14:36.373884');
INSERT INTO django_admin_log VALUES(34,'1','bánh kem socola',3,'',8,1,'2023-04-30 14:14:36.387886');
INSERT INTO django_admin_log VALUES(35,'1','bánh kem',3,'',7,1,'2023-04-30 14:14:45.793812');
INSERT INTO django_admin_log VALUES(36,'19','Strawberry Sachertorte',2,'[{"changed": {"fields": ["Image url"]}}]',8,1,'2023-05-01 09:22:12.426682');
INSERT INTO django_admin_log VALUES(37,'3','Tiramisu',2,'[{"changed": {"fields": ["Name"]}}]',7,4,'2023-05-03 09:27:57.290864');
INSERT INTO django_admin_log VALUES(38,'2','Mochi',2,'[{"changed": {"fields": ["Name"]}}]',7,4,'2023-05-03 09:28:04.171147');

CREATE TABLE django_session (
  session_key varchar(40) NOT NULL PRIMARY KEY,
  session_data text NOT NULL,
  expire_date datetime NOT NULL
);
INSERT INTO django_session VALUES('6qodur7889cnennkq0a8zv4y79wd64xn','.eJxVjjkOgzAURO_iOrK8AP5QpucMyH8hkCBbAlNFuXtAoqGdN_M0X0V5T0V19qGGuJdp2DdZh5lVp6y6ZRjpI-kE_I7plTXlVNYZ9VnRF910n1mW59W9Caa4Ted65DaMjTPW-wAIxHWFNJL40HiGiGAAvRUJCBKkbk1j2bnaQYtWqDqkJZe4HJ-NNr8_JL0-pQ:1pslVC:J1Cy5DyNBl1y4-kHBDAax725fNGtc10Wxe767235-ro','2023-05-13 14:24:42.362247');
INSERT INTO django_session VALUES('panbn2jzzujqzl72du7ivklu4pkim2gi','.eJxVjEEOgyAQRe_CuiGghWFcdt8zmIEZq62BRHHV9O7VxI3b_95_X5XKlqvq7E31tNWx31ZZ-olVpxp12SKlj-QD8Jvyq-hUcl2mqA9Fn3TVz8IyP073EhhpHfc33gcvzieHTGjQRy_IznpuQgvgGKAFhBAAAkn0Jlm2aYhoKQmicXu0lkqz6hpjtPn9ATbLPj8:1pt7Y2:9xOkilW0b9gca83PizbBjOwaw6vdOiFDWrUiUmPvx2I','2023-05-14 13:57:06.657213');
INSERT INTO django_session VALUES('enc7f7d8muvcferspbkbvth3wlagvvtj','.eJxVjDsOgzAQBe-ydWT5A3ihTJ8zIO-HQBLZEuAqyt0jJBraNzPvC1xq3mGwNxhT3eexbrqOi8AADi4bJX5rPoC8Un4WwyXv60LmUMxJN_Moop_76V4O5rTNRz1JH6fOWxdCREKWtiGeWEPsgmAitEjBqUZCjdr2tnPifeuxJ6fcwO8PC3Q7Fw:1ptPuy:jasB5kK6HPs_C4Uc8yXpQqUP3CHk9Vhdrggp5XYB4Fc','2023-05-15 09:34:00.132303');
INSERT INTO django_session VALUES('ttmvffyyasncaf41xgrwb3g8oft78dti','.eJxVjMsOgyAURP-FtSGAuYguu-83kPvAamsgUVw1_fdq4qJdzsyZ81YR9zrFfUtrnEUNClTz2xHyK-VzkCfmR9Fccl1n0ieir3XT9yJpuV3sn2DCbTre3LWOybEg94m61h9BWgxAPVixEEgchJEIPDq2YwDHrvOGrRWwxh9SLnuuajCNqqXiogZrjDafL59hPt4:1pu95s:CJFTBdNCyT_9bU9PIl2LDKuRjkzzlPWWNSZJJOh8cWU','2023-05-17 09:48:16.009081');

CREATE TABLE cakeshop_category (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(100) NOT NULL
);
INSERT INTO cakeshop_category VALUES(2,'Mochi');
INSERT INTO cakeshop_category VALUES(3,'Tiramisu');
INSERT INTO cakeshop_category VALUES(4,'Macaron');
INSERT INTO cakeshop_category VALUES(5,'Sachertorte');
INSERT INTO cakeshop_category VALUES(6,'Pavlova');

CREATE TABLE cakeshop_cake (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name varchar(255) NOT NULL,
  category_id int NOT NULL,
  price decimal NOT NULL,
  quantity decimal NOT NULL,
  description text NOT NULL,
  image_url text NULL,
  FOREIGN KEY (category_id) REFERENCES cakeshop_category (id)     
);
INSERT INTO cakeshop_cake VALUES(3,'Daifuku',2,50,70,'With red bean paste cooked with sugar or sweet white beans, Daifuku is loved by all Japanese, the outside is covered with a layer of rice flour or fine white cornstarch is basic, some bakers will add color. natural to make the cake the most beautiful and attractive, the sweet and fragrant taste is hard to describe. This is the most basic Japanese mochi cake and is considered as a hand-carried gift to Vietnam.','https://cdn.tgdd.vn/Files/2021/05/22/1353768/top-15-loai-banh-gao-nhat-ban-mochi-duoc-yeu-thich-nhat-202105221602318163.jpg');
INSERT INTO cakeshop_cake VALUES(4,'Ichigo Daifuku',2,20,50,'A special version of Daifuku, with additional ingredients is red berries, basically the filling is sweet red beans. This is a famous and favorite snack of Japanese children, the sweet taste of red beans blends with the sweet and sour taste of red berries, the taste is great.','https://cdn.tgdd.vn/Files/2021/05/22/1353768/top-15-loai-banh-gao-nhat-ban-mochi-duoc-yeu-thich-nhat-202105221603457041.jpg');
INSERT INTO cakeshop_cake VALUES(5,'Kusa Mochi',2,15,100,'This dish is similar to the Lang Son wormwood cake of the Vietnamese people, with the addition of wormwood (yomogi), this cake looks like wormwood cake but is different in the filling. The filling of Kusa mochi is made from red bean jam to create a sweet taste, and the wormwood-scented crust is great and attractive. This is a dish that is eaten during the holidays in the countryside of Japan, the shape of which is round and square depending on the region.','https://cdn.tgdd.vn/Files/2021/05/22/1353768/top-15-loai-banh-gao-nhat-ban-mochi-duoc-yeu-thich-nhat-202105221604231206.jpg');
INSERT INTO cakeshop_cake VALUES(6,'Mochi Ice Cream',2,15,50,'This is the frozen version of mochi, people freeze mochi cake made from Mochiko - a special powder for making mochi cakes to create a very smooth and attractive cake coating, basically the filling is red or white beans, or matcha of your choice. This dish is very popular with Japanese children because it is frozen into ice cream, at this time the crust is soft and crispy, and the filling is sweet and juicy.','https://cdn.tgdd.vn/Files/2021/05/22/1353768/top-15-loai-banh-gao-nhat-ban-mochi-duoc-yeu-thich-nhat-202105221604554770.jpg');
INSERT INTO cakeshop_cake VALUES(7,'Oshiruko',2,15,50,'This can be said to be water mochi, because this dish is put in a sweet dessert soup containing red beans to make jam Anko is Azuki from Japan, this dish is similar to Vietnamese or Chinese floating cake. The mochi cake is basically the same with the filling of red beans, sweet white beans, the taste is cool, sweet, bar and quite delicious.','https://cdn.tgdd.vn/Files/2021/05/22/1353768/top-15-loai-banh-gao-nhat-ban-mochi-duoc-yeu-thich-nhat-202105221605302554.jpg');
INSERT INTO cakeshop_cake VALUES(8,'Tiramisu Cheese Pancake',3,25,100,'Pancake is a type of cake made from basic ingredients such as flour, eggs, milk and butter, loved by many people around the world. Now this delicious cake is combined with greasy cheese tiramisu cream to create a delicious cake, interwoven with many different flavors. Let''s make this cake for the whole family to enjoy!','https://cdn.tgdd.vn/2021/05/content/2(2)-800x450-3.jpg');
INSERT INTO cakeshop_cake VALUES(9,'Traditional Tiramisu',3,5,100,'The cake inside is soft combined with the cream layer with a greasy, sweet cheese outside. Eating each spoonful of cake, you will feel the sweet and fatty taste mixed with coffee and bitter cocoa to create a delicious and irresistible cake. Now you can make it at home with the recipe of Dien May XANH shared without having to buy outside!','https://cdn.tgdd.vn/2021/05/content/1(2)-800x450-3.jpg');
INSERT INTO cakeshop_cake VALUES(10,'Tiramisu Matcha Green Tea',3,20,150,'In the series of famous tiramisu cakes, this delicious matcha green tea tiramisu is definitely not to be missed. If you are a lover of green tea flavor, do not miss this cake!

The inside of the cake is soft and smooth, covered with greasy cream cheese flavor combined with strong green tea, with a characteristic aroma.','https://cdn.tgdd.vn/2021/05/content/tiramisu-800x450.jpg');
INSERT INTO cakeshop_cake VALUES(11,'Mango Tiramisu',3,25,100,'A deliciously decorated mango tiramisu cake is sure to captivate anyone from young to old. Crispy fatty Sampa cake is alternately arranged in layers with sweet and fatty sweet cream cheese and thin slices of mango.','https://cdn.tgdd.vn/2021/05/content/4(1)-800x450-1.jpg');
INSERT INTO cakeshop_cake VALUES(12,'Strawberry Tiramisu',3,20,100,'If you are a loyal fan of strawberries, try making this strawberry tiramisu right away! Strawberry tiramisu cake has a layer of sweet and fatty cream cheese, the cake underneath is crispy with a little sour taste of strawberries. Enjoy this delicious cake with a cup of afternoon tea or any of your favorite drinks.','https://cdn.tgdd.vn/2021/05/content/tiramisu1-800x450.jpg');
INSERT INTO cakeshop_cake VALUES(13,'Nutella Macarons',4,3,150,'We appeal to all Nutella lovers, who prefer a richer and more bitter chocolate taste! Yes, there is a Nutella macaron that is very popular in the streets of Paris, topped by creative chefs with hazelnuts or crushed pistachios in the middle. Nutella has sprung up in the US over the past few years and people are getting very creative in incorporating it into desserts.','http://backend.macaron.vn/module/ckfinder/userfiles/images/10-vi-banh-macaron-pho-bien-o-bat-cu-tiem-banh-nao-6.jpg');
INSERT INTO cakeshop_cake VALUES(14,'Coconut Macaro',4,3,50,'Toss the shredded coconut into the buttercream mixture and “eat” it all! At La Rosette, we have twice mixed the flavor of coconut fiber with lotus seeds or pineapple; and both times with great success. According to the anthem, when the cake is put in your mouth, you get a sweet and pleasant taste at the same time. The coconut macaron is light but full of flavor and a hint of pineapple or lotus seed tartness is the perfect combination.','http://backend.macaron.vn/module/ckfinder/userfiles/images/10-vi-banh-macaron-pho-bien-o-bat-cu-tiem-banh-nao-7.jpg');
INSERT INTO cakeshop_cake VALUES(15,'Matcha Macaro',4,5,100,'Matcha macarons feature green tea infused with chocolate ganache fillings to deepen their flavor, creating a delicious flavor combination inspired by Japanese bakeries. Matcha powder is one of La Rosette''s favorite flavorings to use in baking because the flavor is so stable and tastes authentic on a variety of European cakes. It is just as delicious as the matcha macaron line.','http://backend.macaron.vn/module/ckfinder/userfiles/images/10-vi-banh-macaron-pho-bien-o-bat-cu-tiem-banh-nao-8.jpg');
INSERT INTO cakeshop_cake VALUES(16,'Macaro Lemon Mint',4,4,100,'Brighten up your day with these delicious Mint Lemon Macarons garnished with some chopped lime zest. This is a wonderful filling that melts in the mouth with a sweet, sour and mildly spicy taste. I bet you have tried this cake at La Rosette and you will feel the divine freshness and a little bit of richness in your mouth, right? Okay, so let''s get to work after enjoying these beautiful, energizing lemon and mint macarons.','http://backend.macaron.vn/module/ckfinder/userfiles/images/10-vi-banh-macaron-pho-bien-o-bat-cu-tiem-banh-nao-9.jpg');
INSERT INTO cakeshop_cake VALUES(17,'Classic Sachertorte',5,6,60,'This is the original version of the cake, invented in the 1830s by Franz Sacher.','https://www.baking-sense.com/wp-content/uploads/2017/12/sacher-9a.jpg.webp');
INSERT INTO cakeshop_cake VALUES(18,'Sachertorte Orange Flavor',5,6,50,'This cake is usually made by adding orange flavor to the dough to create a new flavor.','https://burpple.imgix.net/foods/5bc6acdaec887afd4e61908363_original.?w=645&dpr=1&fit=crop&q=80&auto=format');
INSERT INTO cakeshop_cake VALUES(19,'Strawberry Sachertorte',5,10,60,'This cake adds fresh strawberries to the batter and combines with strawberry jam to create a slightly sweet and sour taste.','https://cookingathomeisfun.com/wp-content/uploads/2020/05/chocolate-strawberry-cake-795px-500x375.jpg');
INSERT INTO cakeshop_cake VALUES(20,'Cashew Sachertorte',5,10,60,'This cake adds roasted cashews to the batter and is garnished with chocolate and cashews.','https://w7.pngwing.com/pngs/447/740/png-transparent-chocolate-cake-sachertorte-dessert-cashew-baked-goods-food-baking-thumbnail.png');
INSERT INTO cakeshop_cake VALUES(21,'Classic Pavlova',6,6,60,'This cake is the original Pavlova and is made with meringue (egg powder and sugar) and whipping cream, garnished with fresh fruit like strawberries, blueberries and bananas.','https://img.taste.com.au/t0UcNlyF/w1200-h630-cfill/taste/2016/11/classic-pavlova-104875-1.jpeg');
INSERT INTO cakeshop_cake VALUES(22,'Pavlova With Passion Fruit',6,10,91,'This Pavlova is made with a layer of whipped cream mixed with passion fruit juice and garnished with fresh fruits like strawberries, grapes and oranges.','https://foodhub.scene7.com/is/image/woolworthsltdprod/1811-pavlova-with-summer-fruit-passionfruit-syrup:Desktop-1300x658');
INSERT INTO cakeshop_cake VALUES(23,'Pavlova Strawberry Flavor',6,10,22,'This cake is made with whipped cream and garnished with fresh strawberries and dark chocolate.','https://img.taste.com.au/4pBEPiyl/taste/2016/11/strawberry-pavlova-107222-1.jpeg');
INSERT INTO cakeshop_cake VALUES(24,'Pavlova Caramel',6,10,53,'This cake is made with caramel ice cream and garnished with fresh fruits like bananas, grapes and pears.','https://www.snixykitchen.com/wp-content/uploads/2019/01/Salted-Caramel-Cheesecake-Mini-Pavlova-Cakes-PIN-2-1-720x720.jpg');
INSERT INTO cakeshop_cake VALUES(25,'Pavlova Chocolate Flavor',6,10,54,'This Pavlova is made with chocolate meringue, whipping cream and garnished with grated chocolate and fresh fruit like strawberries, berries and kiwi.','https://i1.wp.com/c6.staticflickr.com/9/8494/29113971901_918fbafa90_z.jpg?resize=640%2C427&ssl=1');

CREATE TABLE cakeshop_order (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id integer NOT NULL,
  cake_id integer NOT NULL,
  quantity decimal NOT NULL,
  FOREIGN KEY (user_id) REFERENCES auth_user (id),
  FOREIGN KEY (cake_id) REFERENCES cakeshop_cake (id)
);
INSERT INTO cakeshop_order VALUES(4,2,8,8);

CREATE TABLE cakeshop_bill (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id integer NOT NULL,
  email varchar(254) NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  address varchar(255) NOT NULL,
  town_city varchar(50) NOT NULL,
  phone_number varchar(12) NOT NULL,
  add_information text NULL,
  cake_list text NOT NULL CHECK ((JSON_VALID(cake_list) OR cake_list IS NULL)),
  total_price decimal NOT NULL,
  date datetime NOT NULL,
  FOREIGN KEY (user_id) REFERENCES auth_user (id)     
);

