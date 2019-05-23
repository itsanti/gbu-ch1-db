######################
### solution
######################
# add email-name pairs
> HSET email_name "1@g.com" "alex"
> HSET email_name "2@g.com" "jhone"
> HSET email_name "3@g.com" "alex"

> SADD "alex" "1@g.com" "3@g.com"
> SADD "jhone" "2@g.com"

######################
### result
######################

# email-name search
> HGET email_name "1@g.com"
"alex"

# name-email search
> SMEMBERS alex
1) "3@g.com"
2) "1@g.com"