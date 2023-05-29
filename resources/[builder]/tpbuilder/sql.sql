CREATE TABLE `tpbuilder` (
  `id` int(11) NOT NULL,
  'name' varchar(255) NOT NULL,
  `coordsenter` varchar(255) NOT NULL,
  `coordsexit` varchar(255) NOT NULL,
  `textenter` varchar(50) NOT NULL,
  `textexit` varchar(50) NOT NULL,
  `vehenter` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `tpbuilder`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tpbuilder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;