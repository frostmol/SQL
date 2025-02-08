INSERT INTO `firmName` (`firmID`, `name`, `adress`) VALUES
(1, 'FirmA', 'AddressA'),
(2, 'FirmB', 'AddressB'),
(3, 'FirmC', 'AddressC'),
(4, 'FirmD', 'AddressD'),
(5, 'FirmE', 'AddressE'),
(6, 'FirmF', 'AddressF');
INSERT INTO `driver` (`driverId`, `fio`, `firmID`) VALUES
(1, 'Ivanov Ivan', 1),
(2, 'Petrov Petr', 2),
(3, 'Sidorov Sidor', 3),
(4, 'Sashov Saha', 1),
(5, 'Igorov Igor', 2),
(6, 'Danilov Danil', 3),
(7, 'Olegov Oleg', 1),
(8, 'Alexandrov Alexandr', 2),
(9, 'Petrov Petr', 3),
(10, 'Ilyov Ilya', 1),
(11, 'Artemov Artem', 2),
(12, 'Olegov Oleg', 3);
INSERT INTO `gruz` (`gruzID`, `mass`, `cost`, `naming`, `description`) VALUES
(1, 100, 1000, 'Gruz1', 'Description1'),
(2, 200, 2000, 'Gruz2', 'Description2'),
(3, 200, 3000, 'Gruz3', 'Description3'),
(4, 300, 2000, 'Gruz4', 'Description4'),
(5, 600, 5000, 'Gruz5', 'Description5'),
(6, 750, 9000, 'Gruz6', 'Description6'),
(7, 3000, 30000, 'Gruz7', 'Description7');
INSERT INTO `Travel` (`travelID`, `date`, `departurepoint`, `destination`, `driverId`, `carID`) VALUES
(1, '2023-01-01', 'PointA', 'PointB', 1, 1),
(2, '2024-01-02', 'PointC', 'PointB', 2, 2),
(3, '2022-01-03', 'PointE', 'PointF', 3, 3),
(4,'2024-01-02', 'PointC', 'PointB', 4, 2),
(5, '2022-01-01', 'PointA', 'PointB', 5, 1),
(6, '2024-01-02', 'PointC', 'PointB', 7, 2),
(7, '2022-01-03', 'PointE', 'PointF', 8, 3);
INSERT INTO `Car` (`carID`, `typeOFcar`, `brandOFcar`, `firmID`) VALUES
(1, 'Sedan', 'BrandA', 1),
(2, 'SUV', 'BrandB', 2),	
(3, 'Hatchback', 'BrandC', 3);
INSERT INTO `gruzTrevel` (`gruzID`, `date`, `travelID`) VALUES
(1, '2023-01-01', 1),
(2, '2024-01-02', 2),
(3, '2022-01-03', 3),
(4, '2024-01-02', 4),
(5, '2022-01-01', 5),
(6, '2024-01-02', 6),
(7, '2022-01-03', 7);