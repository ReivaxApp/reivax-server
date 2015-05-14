# Reivax server

Test it:

```
$ iex -S mix
iex> {:ok, pid} = Reivax.Manager.start_link
iex> Reivax.Manager.create(pid, "acoolname", "acoolsearch")
```

Now, do a `tail -f twitter.txt` (in the root folder of the project). Tada, you are streaming.

Right now the only way to stop this madness is to kill the stuff. HF.
