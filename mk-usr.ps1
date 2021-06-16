#Creación de usuarios de forma masiva.
$usuarios=Import-Csv -Path c:\PSD-User\usuario.csv
foreach  ($i in $usuarios)
	{
	$clave=ConvertTo-SecureString $i.contra -AsPlainText -Force
    	New-LocalUser $i.nombre -FullName $i.nombrecompleto -Description $i.descripcion -Password $clave -AccountNeverExpires -PasswordNeverExpires
    	Add-LocalGroupMember -Group usuarios -Member $i.nombre
   	Add-LocalGroupMember -Group "Usuarios de escritorio remoto" -Member $i.nombre
	}
