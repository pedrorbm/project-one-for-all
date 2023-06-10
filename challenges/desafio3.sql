SELECT
  pu.nome_usuario AS pessoa_usuaria,
  COUNT(mo.reproducao_id) AS musicas_ouvidas,
  (SELECT ROUND(SUM(duracao) / 60, 2) FROM SpotifyClone.musica
  WHERE musica_id IN (SELECT musica_id FROM SpotifyClone.reproducao WHERE usuario_id = pu.usuario_id)) AS total_minutos
FROM
  SpotifyClone.usuario AS pu
INNER JOIN
  SpotifyClone.reproducao AS mo ON pu.usuario_id = mo.usuario_id
GROUP BY pu.nome_usuario, pu.usuario_id
ORDER BY pu.nome_usuario ASC;
