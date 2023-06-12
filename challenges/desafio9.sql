SELECT IF(repro.usuario_id <> null, COUNT(*), COUNT(*)) AS musicas_no_historico
FROM SpotifyClone.usuario AS user
INNER JOIN SpotifyClone.reproducao AS repro
	ON user.usuario_id = repro.usuario_id
WHERE user.usuario_id = 1;
