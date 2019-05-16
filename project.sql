CREATE TABLE `customer` (
	`Identity_Card_Number` VARCHAR(255) NOT NULL,
	`home_phone_number` VARCHAR(255) NOT NULL,
	`Mobile_Phone_Number` VARCHAR(255) NOT NULL,
	`registration date` DATE NOT NULL,
	`FirstName` VARCHAR(255) NOT NULL,
	`LastName` VARCHAR(255) NOT NULL,
	`Address` TEXT NOT NULL,
	`City` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`Identity_Card_Number`)
);

CREATE TABLE `Plans/Services` (
	`packet_id` INT NOT NULL,
	`price` FLOAT NOT NULL,
	`category` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`packet_id`)
);

CREATE TABLE `Company/business` (
	`Tax_Identification_Number` VARCHAR(255) NOT NULL,
	`phone number` INT NOT NULL,
	` company name` VARCHAR(255) NOT NULL,
	`registration date` DATE NOT NULL,
	`Address` TEXT NOT NULL,
	`City` VARCHAR(255) NOT NULL,
	`Stuff` INT NOT NULL,
	`e-mail` TEXT NOT NULL,
	PRIMARY KEY (`Tax_Identification_Number`)
);

CREATE TABLE `Buys` (
	`Identity_Card_Number` VARCHAR(255) NOT NULL,
	`packet_id` INT NOT NULL,
	`purchase date` DATE NOT NULL,
	PRIMARY KEY (`Identity_Card_Number`,`packet_id`,`purchase date`)
);

CREATE TABLE `Buys_1` (
	`Tax_Identification_Number` VARCHAR(255) NOT NULL,
	`packet_id` INT NOT NULL,
	`purchase date` DATE NOT NULL,
	PRIMARY KEY (`Tax_Identification_Number`,`packet_id`,`purchase date`)
);

CREATE TABLE `Manager` (
	`Tax_Identification_Number` VARCHAR(255) NOT NULL,
	`Identity_Card_Number` VARCHAR(255) NOT NULL,
	`packet` INT NOT NULL,
	`FirstName` VARCHAR(255) NOT NULL,
	`LastName` VARCHAR(255) NOT NULL,
	`Ofiice_phone` VARCHAR(255) NOT NULL,
	`Address` TEXT NOT NULL,
	`City` VARCHAR(255) NOT NULL,
	PRIMARY KEY (`Tax_Identification_Number`)
);

CREATE TABLE `Mobile packets` (
	`packet_id` INT NOT NULL,
	`Minutes` INT NOT NULL,
	`SMS` INT NOT NULL,
	`Internet(MB)` INT NOT NULL,
	`description` TEXT NOT NULL,
	PRIMARY KEY (`packet_id`)
);

CREATE TABLE `Home packets` (
	`packet_id` INT NOT NULL,
	`Minutes` INT NOT NULL,
	`Internet(Mbps)` INT NOT NULL,
	`descriptio` TEXT NOT NULL,
	PRIMARY KEY (`packet_id`)
);

ALTER TABLE `Buys` ADD CONSTRAINT `Buys_fk0` FOREIGN KEY (`Identity_Card_Number`) REFERENCES `customer`(`Identity_Card_Number`);

ALTER TABLE `Buys` ADD CONSTRAINT `Buys_fk1` FOREIGN KEY (`packet_id`) REFERENCES `Plans/Services`(`packet_id`);

ALTER TABLE `Buys_1` ADD CONSTRAINT `Buys_1_fk0` FOREIGN KEY (`Tax_Identification_Number`) REFERENCES `Company/business`(`Tax_Identification_Number`);

ALTER TABLE `Buys_1` ADD CONSTRAINT `Buys_1_fk1` FOREIGN KEY (`packet_id`) REFERENCES `Plans/Services`(`packet_id`);

ALTER TABLE `Manager` ADD CONSTRAINT `Manager_fk0` FOREIGN KEY (`packet`) REFERENCES `Plans/Services`(`packet_id`);

ALTER TABLE `Mobile packets` ADD CONSTRAINT `Mobile packets_fk0` FOREIGN KEY (`packet_id`) REFERENCES `Plans/Services`(`packet_id`);

ALTER TABLE `Home packets` ADD CONSTRAINT `Home packets_fk0` FOREIGN KEY (`packet_id`) REFERENCES `Plans/Services`(`packet_id`);
