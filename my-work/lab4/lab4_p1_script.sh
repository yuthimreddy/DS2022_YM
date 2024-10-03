#!/bin/bash

curl https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png > google_logo.png

aws s3 cp google_logo.png s3://ds2022-hva4zb/

aws s3 presign --expires-in 604800 s3://ds2022-hva4zb/google_logo.png

# The --expires-in flag is how many seconds the file should be public.
# The s3:// is the BUCKET+FILE path to your specific file.
