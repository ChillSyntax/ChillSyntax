USE `shopping-cart`;
DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `pid` VARCHAR(45) NOT NULL,
  `pname` VARCHAR(100) NULL DEFAULT NULL,
  `ptype` VARCHAR(20) NULL DEFAULT NULL,
  `pinfo` VARCHAR(350) NULL DEFAULT NULL,
  `pprice` DECIMAL(12,2) NULL DEFAULT NULL,
  `pquantity` INT NULL DEFAULT NULL,
  `image` LONGBLOB NULL DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) VALUES 
('P20240519001', 'Apple MacBook M3', 'laptop', 'The revolutionary Apple MacBook with M3 chip features exceptional performance and battery life.', 149999, 100);

INSERT INTO `product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) VALUES 
('P20240519002', 'Samsung Galaxy Book5 Pro', 'laptop', 'Samsung Galaxy Book5 Pro combines powerful performance with ultra-mobility.', 129999, 100);

-- Add a few more products to test
INSERT INTO `product` (`pid`, `pname`, `ptype`, `pinfo`, `pprice`, `pquantity`) VALUES 
('P20240519003', 'HP Spectre x360 14', 'laptop', 'The HP Spectre x360 14 is a premium 2-in-1 laptop with a gorgeous OLED display.', 139999, 100),
('P20240519004', 'Fujifilm X100VI Black', 'camera', 'The Fujifilm X100VI combines classic design with modern technology.', 159999, 50);
