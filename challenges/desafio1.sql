DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_plano VARCHAR(512),
    valor VARCHAR(512)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_artista VARCHAR(512)
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_album VARCHAR(512),
    ano_lancamento INT,
    artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(512),
    idade INT,
    plano_id INT,
    data_assinatura	VARCHAR(512),
    FOREIGN KEY (plano_id) REFERENCES SpotifyClone.plano(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.musica(
    musica_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_musica VARCHAR(512),
    duracao INT,
    album_id INT,
    artista_id INT,
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.album(album_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.reproducao(
    reproducao_id INT PRIMARY KEY AUTO_INCREMENT,
    musica_id INT,
    usuario_id INT,
    data_reproducao DATETIME UNIQUE,
    FOREIGN KEY (musica_id) REFERENCES SpotifyClone.musica(musica_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguidor(
    usuario_id INT,
    artista_id INT,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuario(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artista(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plano (nome_plano, valor)
VALUES
  ('gratuito', '0'),
  ('universitário', '5.99'),
  ('pessoal', '6.99'),
  ('familiar', '7.99');
  
INSERT INTO SpotifyClone.artista (nome_artista)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.album (nome_album, ano_lancamento, artista_id)
VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 4),
  ('Somewhere Far Beyond', 2007, 5),
  ('I Put A Spell On You', 2012, 6);
  
INSERT INTO SpotifyClone.usuario (nome_usuario, idade, plano_id, data_assinatura)
VALUES
  ('Barbara Liskov', 82, 1, '2019-10-20'),
  ('Robert Cecil Martin', 58, 1, '2017-01-06'),
  ('Ada Lovelace', 37, 4, '2017-12-30'),
  ('Martin Fowler', 46, 4, '2017-01-17'),
  ('Sandi Metz', 58, 4, '2018-04-29'),
  ('Paulo Freire', 19, 4, '2018-02-14'),
  ('Bell Hooks', 26, 2, '2018-01-05'),
  ('Christopher Alexander', 85, 2, '2019-06-05'),
  ('Judith Butler', 45, 3, '2020-05-13'),
  ('Jorge Amado', 58, 3, '2017-02-17');
  
  
INSERT INTO SpotifyClone.musica (nome_musica, duracao, album_id, artista_id)
VALUES
  ('BREAK MY SOUL', 279, 1, 1),
  ("VIRGO'S GROOVE", 369, 1, 1),
  ('ALIEN SUPERSTAR', 116, 1, 1),
  ("Don't Stop Me Now", 203, 2, 2),
  ('Under Pressure', 152, 3, 2),
  ('Como Nossos Pais', 105, 4, 3),
  ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
  ('Samba em Paris', 267, 6, 4),
  ("The Bard's Song", 244, 7, 5),
  ('Feeling Good', 100, 8, 6);
  
INSERT INTO SpotifyClone.reproducao (musica_id, usuario_id, data_reproducao)
VALUES
  (8, 1, '2022-02-28 10:45:55'),
  (2, 1, '2020-05-02 05:30:35'),
  (10, 1, '2020-03-06 11:22:33'),
  (10, 2, '2022-08-05 08:05:17'),
  (7, 2, '2020-01-02 07:40:33'),
  (10, 3, '2020-11-13 16:55:13'),
  (2, 3, '2020-12-05 18:38:30'),
  (8, 4, '2021-08-15 17:10:10'),
  (8, 5, '2022-01-09 01:44:33'),
  (5, 5, '2020-08-06 15:23:43'),
  (7, 6, '2017-01-24 00:31:17'),
  (1, 6, '2017-10-12 12:35:20'),
  (4, 7, '2011-12-15 22:30:49'),
  (4, 8, '2012-03-17 14:56:41'),
  (9, 9, '2022-02-24 21:14:22'),
  (3, 10, '2015-12-13 08:30:22');
  
INSERT INTO SpotifyClone.seguidor (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);
