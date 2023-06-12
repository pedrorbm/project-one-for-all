SELECT mus.nome_musica AS 'cancao',
	COUNT(repro.musica_id) AS 'reproducoes'
FROM SpotifyClone.musica AS mus
INNER JOIN SpotifyClone.reproducao AS repro
	ON mus.musica_id = repro.musica_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;
