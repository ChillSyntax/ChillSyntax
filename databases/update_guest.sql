USE `shopping-cart`;

-- Update guest user details
UPDATE `user` 
SET mobile = 9876543210,
    address = 'Greater Noida',
    pincode = 201306
WHERE email = 'guest@gmail.com';
