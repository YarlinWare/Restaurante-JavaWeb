INSERT INTO `perfil` (`idPerfil`, `cargo`, `descripcion`) 
VALUES ('1', 'Administrador', 'Administrador del restaurante'), 
('2', 'Camarero', 'Empleado del restaurante'),('3', 'Cliente', 'Cliente del restaurante');

INSERT INTO `usuario` (`idUsuario`, `idPerfil`, `nombres`, `apellidos`, `correo`, `celular`, `password`) 
VALUES ('1', '1', ' Arquímedes', 'Hernandez', 'ahernandez@restaurante.com', '3109879876', 'administrador'), 
('2', '2', 'Herodes', 'Perez', 'hperez@restaurante.com', '3109876543', 'camarero'),
('3', '3', 'Charlotte', 'Johnson', 'cjohnson@restaurante.com', '3109876542', 'cliente');

INSERT INTO `formapago` (`IdFormaPago`, `Nombre`, `Estado`) VALUES ('1', 'Tarjeta', '1'), ('2', 'Efectivo', '1');

INSERT INTO `pedido` (`idPedido`, `idUsuario`, `Fecha`, `Mesa`, `estado`) VALUES ('1', '3', '2020-03-05', '01', '1'), ('2', '3', '2020-03-07', '02', '1');
INSERT INTO `productos` (`idProducto`, `nombre`, `descripcion`, `valor`, `estado`) VALUES ('1', 'Panino Caprese', 'Queso bocconcini de búfala, mozzarella, albahaca y tomates secos, con pesto y reducción de balsámico. ', '19500', '1');
INSERT INTO `productos` (`idProducto`, `nombre`, `descripcion`, `valor`, `estado`) VALUES ('2', 'Bowl Caprese', 'Queso bocconcini de búfala, pasta penne a la napolitana, albahaca y tomates cherry, con aceite de oliva. ', '21000', '1'), ('3', 'Bowl Feta', 'Queso bocconcini de búfala o tofu, pasta penne al pesto, maíz, queso feta, ajonjolí, tomates cherry, aguacate y mix de lechugas; con vinagreta campiña.', '20000', '1');
INSERT INTO `productos` (`idProducto`, `nombre`, `descripcion`, `valor`, `estado`) VALUES ('4', 'Crema de champiñones', 'Crema de champiñones acompañada con pancitos y parmesano. ', '13500', '1'), ('5', 'Panino Pollo Carbonara', 'Pollo a la plancha con champiñón portobello y tocineta; cubierto con salsa carbonara y mozzarella. ', '26100', '1');
INSERT INTO `productos` (`idProducto`, `nombre`, `descripcion`, `valor`, `estado`) VALUES ('6', 'Canelones Ricotta y Espinaca', 'Tres rollos de pasta artesanal, rellenos con espinaca, ricotta y tomates secos, gratinados con salsa blanca, napolitana y parmesano. ', '21600', '1'), ('7', 'Bowl Pesto', 'Queso bocconcini de búfala o tofu, cuscús al pesto, tomates cherry, champiñones salteados, zanahorias rostizadas y mix de lechugas; con aderezo ranch. ', '21000', NULL);
INSERT INTO `usuario` (`idUsuario`, `idPerfil`, `nombres`, `apellidos`, `correo`, `celular`, `password`) VALUES ('4', '1', 'Sophia', 'Reyes', 'sreyes@restaurante.com', '3009876765', 'administrador'), ('5', '3', 'Pedro', 'Perez', 'pperez@restaurante.com', '3109996543', 'cliente');
