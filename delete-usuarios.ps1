#Eliminacion de usuarios de forma masiva.
	$usuarios=Import-Csv -Path c:\PSD-User\usuario.csv
	foreach  ($i in $usuarios)
	{
		Remove-LocalUser $i.nombre
	}
