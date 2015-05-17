# Reivax server

Test it:

```
$ iex -S mix
iex> {:ok, pid} = Reivax.Manager.start_link
iex> Reivax.Manager.create(pid, "acoolname")
```

Now, do a `tail -f dev.txt` (in the root folder of the project). Tada, you are streaming.

Right now the only way to stop this madness is to kill the stuff. HF.

![this_is_madness](http://24.media.tumblr.com/tumblr_lvxwnq9mra1qmt85zo1_500.jpg)

## Resources

- Tweets object: https://dev.twitter.com/overview/api/tweets
- Users object: https://dev.twitter.com/overview/api/users
- Public stream api: https://dev.twitter.com/streaming/public
- api REST, GET search/tweets: https://dev.twitter.com/rest/reference/get/search/tweets
- application-only authentication: https://dev.twitter.com/oauth/application-only
