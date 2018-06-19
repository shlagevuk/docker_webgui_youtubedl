# Webgui + youtube-dl

webgui youtube-dl is a combination of [script-server](https://github.com/bugy/script-server) and a wrapper around [youtube-dl](https://github.com/rg3/youtube-dl).

## what it do

The wrapper script take only a youtube url (or other compatible media plateform) and download best video+audio, subtitle, images. Then it goes to a mkv container for video/audio/subtitle wrapping, and at last images is converted for plex miniatures.

## notes

- The wrapper also use a youtube_archive.txt for '--download-archive' option of youtube-dl. So you don't have to re-dl all video of a playlist or channel, only new content.
- only english and french subtitles are downloaded (it take a very long time to DL everything).


# how to use

```
docker run -d -p 2000:2000  -v /path/to/target/dl:/data --name youtube-gui shlagevuk/docker_webgui_youtubedl
```

# Warning

Be careful with exposing this service on the internet, [script-server security](https://github.com/bugy/script-server#security) say it may be subject to XSS and CSFR attacks!
