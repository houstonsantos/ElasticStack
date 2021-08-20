SELECT
    a.filial, a.entrada, a.empresa, a.serie, 
    a.nf, a.fatura, a.dt_emissao, a.dt_entrada, 
    a.val_frete, a.val_seguro, a.val_outras_desp, 
    a.val_total_nota, a.desconto, a.dt_entrada_emp,
    TO_NUMBER(a.fornecedor), a.grupo_lanc, a.cod_tipo_documento, 
    a.dat_aceite, a.val_seguro_servico, a.val_outras_desp_servico, 
    a.val_desconto_servico, a.num_contrato, a.val_frete_t1,
    a.cod_condpag, a.cod_tipo_entrada, a.cod_comprador,
    a.dat_inclusao_registro, a.cod_tipo_documento_titulo,
    a.cod_portador_titulo, a.cod_agencia_titulo,
    a.cod_conta_corrente_titulo, a.dat_inicio_servico,
    a.dat_fim_servico, a.dat_alteracao_registro,
    b.fantasia, b.nome
FROM 
    PIRAMIDE.entrada a
INNER JOIN PIRAMIDE.fornec b
    ON a.fornecedor = b.codigo
WHERE 
    a.dt_entrada >= TO_DATE('01/08/2021','dd/mm/yyyy') AND
    a.entrada > :sql_last_value