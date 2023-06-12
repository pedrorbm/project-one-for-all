SELECT user.nome_usuario AS pessoa_usuaria,
	IF(MAX(YEAR(repro.data_reproducao)) >= 2021, 'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM SpotifyClone.usuario AS user
INNER JOIN SpotifyClone.reproducao AS repro
	ON user.usuario_id = repro.usuario_id
GROUP BY pessoa_usuaria
ORDER BY pessoa_usuaria ASC;
