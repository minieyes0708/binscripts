cmd /c takeown /F %1 /R /D Y; cmd /c icacls %1 /grant:r (Read-Host "User Acount"):F /T 
