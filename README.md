# Github API Examples
*Examples of how to access github using API Access*<br>
Resources:<br>
* https://developer.github.com/v3/auth/#basic-authentication
* https://developer.github.com/v3/repos

## Authentication
```
# Password asked upon request
curl -u [username] https://api.github.com/user

# Password provided within command (insecure)
curl -u '[username]:[password]' https://api.github.com/user

# Token provided from github (token access can be revoked using site login)
curl -u '[username]:[token]' https://api.github.com/user

```

## Simple Requests Using CURL
### Get info on your user account
```
curl -X GET -u '[username]:[token]' https://api.github.com/user
```

### Get all your repos
```
curl -X GET -u '[username]:[token]' https://api.github.com/user/repos
```

### Add new repo with readme
```
curl -X POST \
  https://api.github.com/user/repos \
  -u '[username]:[token]' \
  -H 'Content-Type: application/json' \
  -d '{ "name": "[repo_name]", "private": false, "auto_init": true }'

```
