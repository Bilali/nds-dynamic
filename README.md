Nairobi Dev School
===
Staging Deploy
---
It's just heroku. `git push heroku master`


Production Deploy
---
It should be as easy as:

```
  bundle exec cap deploy
```

There is one server at 37.139.15.190. You have SSH access by `ssh root@37.139.15.190`. If either of these two statements are untrue, please send (a nice) message to @jetaggart.

The server runs nginx as root with a reverse proxy set up to point at unicorn running as deploy. The application directory is under `/home/deploy/nds`. Please be careful looking, poking, prodding the server. Logs are all local to the application root (`/home/deploy/nds`), except for the nginx access logs, which are in `/var/log/nginx`.

If none of that makes sense, ask @jetaggart.




