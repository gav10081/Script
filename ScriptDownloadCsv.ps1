$json = Invoke-WebRequest -method GET -uri 'https://script.googleusercontent.com/macros/echo?user_content_key=AFdPHQLd99hT1MgORLLmH5w05rv9IcIKDsD-lkh7tPy6ew6ln7qUFeyIK-CcBji6vzTH56tO_4OkbiVT9broIGXiin3NCH1Em5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnN6g8FAb4_qvUK4pwDLtrMSMQwJXiO6vlWuL4yUyA1QF54YH55WdVF55mUTXqC2bQqOIp7sEUsJ2&lib=M81MDSeOjSppjpqLFyRcxPU2g8KJeqI-J' -Headers $headers | ConvertFrom-Json

$header = $json[0]| ConvertTo-CSV -NoTypeInformation
for($i=1;$i -lt $json.Count-1;$i++)
{
 
 $data += $json[$i]| ConvertTo-CSV -NoTypeInformation| select -Skip 1 

 #echo $json[$i]
}

$Path = "$env:userprofile\Downloads\exec2.csv"

$json |
     Select-Object date, victim, breached, disclosed, encrypted, actor, sector, licens |ConvertTo-CSV -NoTypeInformation |
     Out-File -FilePath $Path 


start $Path