$uri = "http://localhost:8080/api/auth/login"
$body = @{
    email = "admin@citizenconnect.com"
    password = "admin123"
} | ConvertTo-Json

$headers = @{
    "Content-Type" = "application/json"
}

$response = Invoke-RestMethod -Uri $uri -Method Post -Body $body -Headers $headers
$response | ConvertTo-Json
