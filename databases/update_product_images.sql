USE `shopping-cart`;
START TRANSACTION;

-- Create a temporary table to store image data
CREATE TEMPORARY TABLE temp_images (
    pid VARCHAR(45) NOT NULL,
    image_path VARCHAR(255) NOT NULL,
    PRIMARY KEY (pid)
);

-- Insert image paths
INSERT INTO temp_images (pid, image_path) VALUES 
('P20240519001', 'apple mackbook m3.png'),
('P20240519002', 'Galaxy-Book5-Pro.png'),
('P20240519003', 'hp spector x360 14.png'),
('P20240519004', 'Fujifilm-X100VI-Black.png'),
('P20240519005', 'Nikon-Z-fc-DX.png'),
('P20240519006', 'Sony-ZV-E10.png'),
('P20240519007', 'ipad 11 pro.png'),
('P20240519008', 'Samsung-Galaxy-Tab-S9.png'),
('P20240519009', 'xiomai ipad 6.png'),
('P20240519010', 'iphone 15pro max.png'),
('P20240519011', 'oneplus 13.png'),
('P20240519012', 'samsung-galaxy-z-fold6.png'),
('P20240519013', 'Godrej WFEON.png'),
('P20240519014', 'Godrej WS EDGE.png'),
('P20240519015', 'Godrej WTEON.png'),
('P20240519016', 'LG 32LQ635BPSA.png'),
('P20240519017', 'LG 32LR570B6LA.png'),
('P20240519018', 'LG 32LR605B6LC.png'),
('P20240519019', 'JBL Boombox 3.png'),
('P20240519020', 'JBL Charge 5.png'),
('P20240519021', 'JBL Flip 6.png'),
('P20240519022', 'XElectron C9 Plus.png'),
('P20240519023', 'XElectron C9 Standard.png'),
('P20240519024', 'XElectron iProjector.png');

-- Now let's copy these images to the product table
UPDATE product p 
JOIN temp_images t ON p.pid = t.pid
SET p.image = LOAD_FILE(CONCAT('C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\new-images\\', t.image_path))
WHERE p.pid = t.pid;

-- Drop temporary table
DROP TEMPORARY TABLE temp_images;

COMMIT;
