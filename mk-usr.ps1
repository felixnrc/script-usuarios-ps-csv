#Creación de usuarios de forma masiva.
	$usuarios=Import-Csv -Path c:\PSD-User\usuario.csv
	foreach  ($i in $usuarios)
	{
		$clave=ConvertTo-SecureString $i.contra -AsPlainText -Force
    #Se crea el Usuario con lo cargado en usuario.csv
    New-LocalUser $i.nombre -FullName $i.nombrecompleto -Description $i.descripcion -Password $clave -AccountNeverExpires -PasswordNeverExpires
		#Se agrega los usuario creados al siguiente grupo (grupo default usuario)
    Add-LocalGroupMember -Group usuarios -Member $i.nombre
	}
