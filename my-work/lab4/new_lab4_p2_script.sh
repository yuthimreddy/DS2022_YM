#!/Users/yuthimadireddy/anaconda3/bin/python

import requests
import webbrowser
import urllib.request
import boto3

# URL of the file you want to download

sponge_pat_url = "https://i.redd.it/l4jxd7bgzsva1.jpg"

# Local file name to save the downloaded file
local_file_name = "downloaded_sponge_pat.jpg"

# Step 1: Download the file
def download_file(url, save_as):
    try:
        # Download the file and save it locally
        urllib.request.urlretrieve(url, save_as)
        print(f"File downloaded and saved as {save_as}")
    except Exception as e:
        print(f"An error occurred: {e}")

# Call the function to download the file
download_file(sponge_pat_url, local_file_name)


# Step 2: Upload to S3
# Create the S3 client
s3 = boto3.client('s3', region_name="us-east-1")

# List the buckets to ensure the connection is working
response = s3.list_buckets()

# Now iterate through the response:
for r in response['Buckets']:
    print(r['Name'])

# Step 3: Upload the downloaded file to S3
bucket = 'ds2022-hva4zb'
s3_key = 'sponge_pat_url'  # The name of the file in S3

# Open the file in binary mode and upload it
try:
    with open(local_file_name, 'rb') as file_data:
        resp = s3.put_object(
            Body=file_data,         # File content
            Bucket=bucket,          # S3 bucket name
            Key=s3_key,             # Name of the file in S3
            ACL='public-read'       # Make the file publicly readable
        )
    print(f"File uploaded successfully to S3 as {s3_key}")
except Exception as e:
    print(f"An error occurred while uploading to S3: {e}")

#making presigned URL

bucket_name = 'ds2022-hva4zb'
expires_in = 604800  # 7 days in seconds

response = s3.generate_presigned_url(
    'get_object',
    Params={'Bucket': bucket_name, 'Key': s3_key},
    ExpiresIn=expires_in
)

# Print the presigned URL to access the uploaded file
print(f"Presigned URL: {response}")
