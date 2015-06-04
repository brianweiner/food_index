json.user do
  json.id @user.id
  json.email @user.email
  json.authenticationToken @user.authentication_token
end
