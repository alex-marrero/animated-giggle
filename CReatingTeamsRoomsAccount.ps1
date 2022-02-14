# Connect to Exchange Online and create a resource
Set-ExecutionPolicy RemoteSigned
Install-Module ExchangeOnlineManagement
$Session = Connect-ExchangeOnline
New-Mailbox -Name "MTR-TeamsRoom" -Alias TeamsRoom -Room -EnableRoomMailboxAccount $true -MicrosoftOnlineServicesID MTR-TeamsRoom@8vm1c0.onmicrosoft.com -RoomMailboxPassword (ConvertTo-SecureString -String 'P@$$W0rd5959' -AsPlainText -Force)
Set-CalendarProcessing -Identity "MTR-TeamsRoom" -AutomateProcessing AutoAccept -AllowConflicts $false -AddOrganizerToSubject $false -DeleteComments $false -DeleteSubject $false -RemovePrivateProperty $false -AddAdditionalResponse $true -AdditionalResponse "This is a Microsoft Teams Room!"

#Sleep for 20 seconds
Start-Sleep 20

#Connect to MS Online to set password to never expires
Connect-MsolService
Set-MsolUser -UserPrincipalName MTR-TeamsRoom@8vm1c0.onmicrosoft.com -PasswordNeverExpires $true
Get-MsolUser -UserPrincipalName MTR-TeamsRoom@8vm1c0.onmicrosoft.com | Select-Object PasswordNeverExpires