# jsqsh

A Docker image with the jsqsh tool installed and configured (https://github.com/scgray/jsqsh).

Comes installed with these drivers:

- PostgreSQL
- Avatica (Druid)

## Building

```bash
./build.sh
```

## Running

```bash
docker run -t -i --rm jsqsh:2.0.0
```
