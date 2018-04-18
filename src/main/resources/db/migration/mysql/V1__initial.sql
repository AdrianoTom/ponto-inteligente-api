CREATE TABLE empresa (
 id BIGINT(20) NOT NULL,
 cnpj VARCHAR(255) NOT NULL,
 data_atualizacao DATETIME NOT NULL,
 data_criacao DATETIME NOT NULL,
 razao_social VARCHAR(255) NOT NULL
 ) ENGINE=InnoDB;

CREATE TABLE funcionario (
 id bigint(20) NOT NULL,
 cpf varchar(255) NOT NULL,
 data_atualizacao DATETIME NOT NULL,
 data_criacao DATETIME NOT NULL,
 email VARCHAR(255) NOT NULL,
 nome VARCHAR(255) NOT NULL,
 perfil VARCHAR(255) NOT NULL,
 qtd_horas_almoco float DEFAULT NULL,
 qtd_horas_trabalho_dia float DEFAULT NULL,
 senha VARCHAR(255) NOT NULL,
 valor_hora decimal(19,2) DEFAULT NULL,
 empresa_id bigint(20) DEFAULT NULL
 ) ENGINE=InnoDB;

CREATE TABLE lancamento (
 id bigint(20) NOT NULL,
 data datetime NOT NULL,
 data_atualizacao datetime NOT NULL,
 data_criacao datetime NOT NULL,
 descricao varchar(255) DEFAULT NULL,
 localizacao varchar(255) DEFAULT NULL,
 tipo varchar(255) NOT NULL,
 funcionario_id bigint(20) DEFAULT NULL
 ) ENGINE=InnoDB;
--
-- Indexes for table 'empresa'
--
ALTER TABLE empresa ADD PRIMARY KEY (id);

--
-- Indexes for table 'funcionario'
--
ALTER TABLE funcionario 
 ADD PRIMARY KEY (id),
 ADD KEY INDX_FKEmpresa (empresa_id);

--
-- Indexes for table 'funcionario'
--
ALTER TABLE lancamento 
 ADD PRIMARY KEY (id),
 ADD KEY INDX_FKFuncionario (funcionario_id);

--
-- AUTO_INCREMENT for table 'empresa'
--
ALTER TABLE empresa
 MODIFY id bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table 'funcionario'
--
ALTER TABLE funcionario
 MODIFY id bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table 'funcionario'
--
ALTER TABLE lancamento
 MODIFY id bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dunped tables
--

--
-- Constraints for table 'funcionarios'
--
ALTER TABLE funcionario 
 ADD CONSTRAINT FK_FUNC_EMPRESA FOREIGN KEY (empresa_id) REFERENCES empresa (id);
--
-- Constraints for table 'lancamento'
--
ALTER TABLE lancamento ADD CONSTRAINT FK_LACTO_FUNC FOREIGN KEY (funcionario_id) REFERENCES funcionario (id);