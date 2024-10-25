use db_food_delivery;

INSERT INTO tb_pedido (pedido_id, cliente_id, endereco_cliente_id, item_id, cardapio_id, estabelecimento_id, horario_solicitacao, horario_entrega, status_pedido, valor_total, avaliacao_pedido_id) 
VALUES 
(1, 1, 1, 1, 1, 1, '12:00:00', '12:30:00', 'ENTREGUE', 15.00, 2),
(2, 2, 2, 2, 2, 2, '12:00:00', '12:30:00', 'ENTREGUE', 15.00, 2),
(3, 3, 3, 3, 3, 3, '13:00:00', '13:40:00', 'ENTREGUE', 10.00, 3),
(4, 4, 4, 4, 4, 4, '14:00:00', '15:00:00', 'ENTREGUE', 60.00, 4),
(5, 5, 5, 5, 5, 5, '15:00:00', '16:00:00', 'ENTREGUE', 30.00, 5),
(6, 6, 6, 6, 6, 6, '16:00:00', '16:45:00', 'ENTREGUE', 35.00, 6),
(7, 7, 7, 7, 7, 7, '17:00:00', '18:15:00', 'ENTREGUE', 20.00, 7),
(8, 8, 8, 8, 8, 8, '18:00:00', '19:00:00', 'ENTREGUE', 40.00, 8),
(9, 9, 9, 9, 9, 9, '19:00:00', '20:30:00', 'ENTREGUE', 50.00, 9),
(10, 10, 10, 10, 10, 10, '19:00:00', '20:30:00', 'ENTREGUE', 50.00, 9);