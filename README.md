Docker container mosibi/renrot
=========
The Docker container [mosibi/renrot](https://hub.docker.com/r/mosibi/renrot) can be used to rotate jpg photo files
according to the EXIF information in the photo.

Add your photo directory to the container with the '-v' option, see "Usage"

This container uses the tool [renrot](https://puszcza.gnu.org.ua/projects/renrot) with
the option --no-rename, thus the original file will be rotated without renaming it.
To keep track of allready rotated photo's, a file with the name `rotated.lst` will be
created in the volume that's mounted on /data. For every photo that is processed, the
md5 hash of the name of the file will be added to `rotated.lst`.

Build from scratch
======
git clone https://github.com/Mosibi/docker-renrot.git
cd docker-renrot
docker build -t mosibi/renrot:<yourtag> .

Usage
======
docker run --rm -v /path/to/photos:/data:z  mosibi/renrot

Add the extra ':z' when your docker host is a system with Selinux support, for
example Fedora, Redhat or CentOS

Arguments
======
* -v /path/to/photos:/data

> Maps a directory from your docker host to the renrot container. Without a
> volume mapped to /data, the mosibi/renrot container won't do anything

Environment arguments
======
None

Usage example
======
* Add a cronjob to your host that will fire the container every day
* Use [inotify](https://en.wikipedia.org/wiki/Inotify) to trigger a run when something has changed in your photo directory
