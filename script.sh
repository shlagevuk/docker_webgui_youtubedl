#! /bin/bash

TO_DL="$1"
DL_FOLDER="/data/tmp"
DONE_FOLDER="/data"

youtube-dl \
--retries '3' \
--no-call-home \
--ignore-errors \
--write-info-json \
--write-description \
--write-thumbnail \
--write-all-thumbnails \
--youtube-skip-dash-manifest \
--sub-lang 'fr,en' \
--write-auto-sub \
--write-sub \
--convert-subs 'srt' \
--add-metadata \
--embed-subs \
--restrict-filenames \
--format 'bestvideo+bestaudio/best' \
--merge-output-format 'mkv' \
--download-archive "${DONE_FOLDER}/youtube_archive.txt" \
--output "${DL_FOLDER}/%(title)s_%(upload_date)s.%(ext)s" \
"${TO_DL}" ;

mv ${DL_FOLDER}/*.mkv ${DONE_FOLDER}/

for i in $(find ${DL_FOLDER} -name "*.jpg"); do
  FILE_NAME=$(basename "${i}" .jpg)
  ffmpeg -y -i "${i}" -vf "scale=600:-1,pad=600:800:0:(oh-ih)/2" "${DONE_FOLDER}/${FILE_NAME}.jpg"
  ffmpeg -y -i "${i}" -vf "scale=-1:600" "${DONE_FOLDER}/${FILE_NAME}-fanart.jpg"
done
rm -f ${DL_FOLDER}/*
