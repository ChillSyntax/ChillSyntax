-- Add new product categories and products
START TRANSACTION;
USE `shopping-cart`;

-- Add new products
-- Laptops
INSERT INTO `shopping-cart`.`product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) 
VALUES 
('P20240519001', 'Apple MacBook M3', 'laptop', 'The revolutionary Apple MacBook with M3 chip features exceptional performance and battery life, with up to 18 hours of usage. Its stunning Retina display and Magic Keyboard provide an unmatched user experience.', 149999, 100),
('P20240519002', 'Samsung Galaxy Book5 Pro', 'laptop', 'Samsung Galaxy Book5 Pro combines powerful performance with ultra-mobility. Features a stunning AMOLED display, Intel Core processor, and all-day battery life in a premium design.', 129999, 100),
('P20240519003', 'HP Spectre x360 14', 'laptop', 'The HP Spectre x360 14 is a premium 2-in-1 laptop with a gorgeous OLED display, Intel Core processor, and gem-cut design. Perfect for both work and creativity.', 139999, 100);

-- Cameras
INSERT INTO `shopping-cart`.`product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) 
VALUES 
('P20240519004', 'Fujifilm X100VI Black', 'camera', 'The Fujifilm X100VI combines classic design with modern technology, featuring a newly designed 40MP X-Trans sensor, improved autofocus, and enhanced image stabilization.', 159999, 50),
('P20240519005', 'Nikon Z-fc DX', 'camera', 'The Nikon Z-fc DX mirrorless camera brings retro style to modern photography with a 20.9MP sensor, vari-angle touchscreen, and exceptional low-light performance.', 94999, 50),
('P20240519006', 'Sony ZV-E10', 'camera', 'The Sony ZV-E10 is designed for content creators, featuring a 24.2MP APS-C sensor, advanced autofocus, and special features for vlogging and streaming.', 64999, 75);

-- Tablets
INSERT INTO `shopping-cart`.`product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) 
VALUES 
('P20240519007', 'iPad 11 Pro', 'tablet', 'The iPad 11 Pro with M2 chip delivers unprecedented performance in a tablet. Features a stunning Liquid Retina XDR display, ProMotion technology, and support for Apple Pencil.', 89999, 100),
('P20240519008', 'Samsung Galaxy Tab S9', 'tablet', 'The Samsung Galaxy Tab S9 offers a premium Android tablet experience with a stunning AMOLED display, S Pen support, and powerful performance for work and play.', 74999, 100),
('P20240519009', 'Xiaomi Pad 6', 'tablet', 'The Xiaomi Pad 6 offers great value with a high-refresh-rate display, powerful Snapdragon processor, and premium design at an accessible price point.', 29999, 150);

-- Smartphones
INSERT INTO `shopping-cart`.`product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) 
VALUES 
('P20240519010', 'iPhone 15 Pro Max', 'mobile', 'The iPhone 15 Pro Max features a titanium design, A17 Pro chip, and a revolutionary camera system with 5x optical zoom. Experience the pinnacle of smartphone technology.', 159999, 100),
('P20240519011', 'OnePlus 13', 'mobile', 'The OnePlus 13 delivers flagship performance with its Snapdragon processor, stunning AMOLED display, and advanced camera system co-developed with Hasselblad.', 79999, 100),
('P20240519012', 'Samsung Galaxy Z Fold 6', 'mobile', 'Experience the future with Samsung Galaxy Z Fold 6, featuring a foldable dynamic AMOLED display, advanced multitasking capabilities, and S Pen support.', 154999, 75);

-- Washing Machines
INSERT INTO `shopping-cart`.`product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) 
VALUES 
('P20240519013', 'Godrej WFEON', 'appliance', 'Godrej WFEON Fully Automatic Front Load Washing Machine with advanced wash programs, energy efficiency, and intelligent sensors for optimal washing.', 35999, 50),
('P20240519014', 'Godrej WS EDGE', 'appliance', 'Godrej WS EDGE combines style with functionality, featuring multiple wash programs, energy-efficient operation, and advanced fabric care technology.', 28999, 50),
('P20240519015', 'Godrej WTEON', 'appliance', 'Godrej WTEON Top Load Washing Machine offers convenience with its easy-to-use interface, multiple wash programs, and efficient water usage.', 24999, 50);

-- TVs
INSERT INTO `shopping-cart`.`product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) 
VALUES 
('P20240519016', 'LG 32LQ635BPSA', 'tv', 'LG 32LQ635BPSA Smart TV features WebOS, Active HDR, and virtual surround sound for an immersive entertainment experience.', 22999, 75),
('P20240519017', 'LG 32LR570B6LA', 'tv', 'LG 32LR570B6LA offers vibrant colors, smart features, and AI sound for enhanced viewing experience at great value.', 19999, 75),
('P20240519018', 'LG 32LR605B6LC', 'tv', 'LG 32LR605B6LC Smart TV comes with ThinQ AI, built-in Google Assistant, and dynamic color enhancement for lifelike pictures.', 24999, 75);

-- Speakers
INSERT INTO `shopping-cart`.`product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) 
VALUES 
('P20240519019', 'JBL Boombox 3', 'speaker', 'JBL Boombox 3 delivers massive sound with deep bass, 24 hours of playtime, and IPX7 waterproof design for ultimate portable entertainment.', 34999, 100),
('P20240519020', 'JBL Charge 5', 'speaker', 'JBL Charge 5 offers powerful JBL Original Pro Sound, 20 hours of playtime, and power bank functionality in a rugged, waterproof design.', 14999, 100),
('P20240519021', 'JBL Flip 6', 'speaker', 'JBL Flip 6 delivers bold JBL Original Pro Sound with deep bass, 12 hours of playtime, and PartyBoost for speaker pairing.', 9999, 100);

-- Projectors
INSERT INTO `shopping-cart`.`product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) 
VALUES 
('P20240519022', 'XElectron C9 Plus', 'projector', 'XElectron C9 Plus Projector features Full HD resolution, 6000 lumens brightness, and wireless connectivity for home theater excellence.', 12999, 50),
('P20240519023', 'XElectron C9 Standard', 'projector', 'XElectron C9 Standard offers HD resolution, 4000 lumens, and multiple connectivity options for versatile projection needs.', 9999, 50),
('P20240519024', 'XElectron iProjector', 'projector', 'XElectron iProjector is a compact and portable projector with built-in battery, Wi-Fi, and smartphone mirroring capabilities.', 7999, 50);

COMMIT;
