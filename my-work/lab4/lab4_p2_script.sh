#!/Users/yuthimadireddy/anaconda3/bin/python

import requests
import webbrowser
import urllib.request

# URL of the file you want to download
Tom_J_url = "https://e7.pngegg.com/pngimages/41/168/png-clipart-tom-cat-jerry-mouse-tom-and-jerry-cartoon-tom-and-jerry-tom-jerry-display-mammal-cat-like-mammal-thumbnail.png"

# Local file name to save the downloaded file
local_named_file = "downloaded_TomJerry.png"

def download_file(Tom_J_url, local_named_file):
    try:
        # Download the file and save it locally
        urllib.request.urlretrieve(Tom_J_url, local_named_file)
        print(f"File downloaded and saved as {local_named_file}")
    except Exception as e:
        print(f"An error occurred: {e}")

# Call the function to download the file
download_file(Tom_J_url, local_named_file)


import boto3

# create client
s3 = boto3.client('s3', region_name="us-east-1")

# make request
response = s3.list_buckets()

# now iterate through the response:
for r in response['Buckets']:
  print(r['Name'])

bucket = 'ds2022-hva4zb'
local_named_file = "downloaded_TomJerry.png"
resp = s3.put_object(
    Body = local_named_file,
    Bucket = bucket,
    Key = local_named_file,
    ACL = 'public-read'
)


# vars needed
bucket_name = 'ds2022-hva4zb'
object_name = 'tom_jerry.png'
expires_in = 604800

response = s3.generate_presigned_url(
    'get_object',
    Params={'Bucket': bucket_name, 'Key': object_name},
    ExpiresIn=expires_in
)

print(response)


