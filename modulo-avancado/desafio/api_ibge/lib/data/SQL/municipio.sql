CREATE TABLE IF NOT EXISTS municipio (
  id INT NOT NULL,
  iduf INT NOT NULL,
  nome VARCHAR(120) NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT uf_municipio FOREIGN KEY (iduf) REFERENCES uf (id) ON DELETE NO ACTION ON UPDATE NO ACTION
)
ENGINE = InnoDB;