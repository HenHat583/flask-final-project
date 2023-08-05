import docker
import re
import os
client = docker.from_env()
images = client.images.list()
# Regular expression pattern to match version numbers in the tag
version_pattern = r"^henhat583/flask-app:(\d+\.\d+)$"
existing_versions = [
    float(re.match(version_pattern, image.tags[0]).group(1))
    for image in images
    if image.tags and re.match(version_pattern, image.tags[0])
]
if existing_versions:
    latest_version = max(existing_versions)
    next_version = latest_version + 0.1
else:
    next_version = 1.0
# Format the version number to one decimal place
next_version = round(next_version, 2)
image_name = f"henhat583/flask-app:{next_version}"
with open(os.environ["GITHUB_OUTPUT"], "a") as GITHUB_OUTPUT:
    print(f"version={image_name}", file=GITHUB_OUTPUT)
