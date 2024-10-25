use db_food_delivery;

select P.pedido_id,
C.nome,
concat('Nº: ', EC.numero, '/', EC.complemento, ' - ', E.cep) as endereco,
CP.categoria as cardapio,
I.nome, I.descricao, I.categoria,
EB.razao_social as estabalecimento,
P.horario_solicitacao, P.horario_entrega, P.status_pedido,
AV.nota, AV.descricao,
P.valor_total,
TP.descricao as forma_pagamento

from tb_pedido as P

inner join tb_cliente as C
on P.cliente_id = C.cliente_id

inner join tb_endereco_cliente as EC
on EC.cliente_id = C.cliente_id

inner join tb_endereco as E
on E.endereco_id = EC.endereco_id

inner join tb_estabelecimento as EB
on EB.estabelecimento_id = P.estabelecimento_id

inner join tb_item as I
on I.item_id = P.item_id

inner join tb_cardapio as CP
on CP.cardapio_id = P.cardapio_id

inner join tb_avaliacao_pedido as AV
on AV.avaliacao_pedido_id = P.avaliacao_pedido_id

inner join tb_pagamento as PM
on PM.pedido_id = P.pedido_id

inner join tb_tipo_pagamento as TP
on PM.tipo_pagamento = TP.tipo_pagamento_id
