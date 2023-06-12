SELECT art.nome_artista AS artista,
	alb.nome_album AS album,
	COUNT(s.artista_id) AS pessoas_seguidoras
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
	ON art.artista_id = alb.artista_id
LEFT JOIN SpotifyClone.seguidor AS s
	ON art.artista_id = s.artista_id
GROUP BY artista, album
ORDER BY pessoas_seguidoras DESC, artista ASC, album ASC;
