# choose

A match for OS X that uses both std{in,out} and a native GUI re-written from
https://github.com/chipsenkbeil/choose using swiftui.

---

- Gets list of items from stdin.
- ~~Fuzzy-searches~~ as you type.
- Sends result to stdout.
- Run choose -h for more info.

### Build and Install Documentation

From root of repository, run:

```bash
make
```

manual page.

## Usage

```bash
$ ls | choose
```

## Related Projects

- https://github.com/chipsenkbeil/choose

## License

See [MIT LICENSE](./LICENSE).
