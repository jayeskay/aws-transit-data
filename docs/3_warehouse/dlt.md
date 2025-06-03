To test it out....

# Attempt 1

This is what I tried at the outset, but then `boto3` wasn't an available library in Mage:

```python
import boto3  

s3_client = boto3.client('s3')  

response = s3_client.list_objects_v2(
    Bucket='nyc-tlc',
    EncodingType='url',
    Prefix='trip data/green_tripdata_2022'
)

for i in response['Contents']:
    print(i['Key'])
```

# Attempt 2

I then moved to using the following, which helped me a) understand how to use `yield` and b) build a generator from scratch:

```python
import requests
import time
import dlt
import duckdb
import pandas as pd
from bs4 import BeautifulSoup

URL = 'https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page'
KEY = 'green_tripdata_2022'


def stream_download_parquet(url: str, key: str) -> pd.DataFrame:
    response = requests.get(url).text
    soup = BeautifulSoup(response, features='html.parser')

    for i, link in enumerate(soup.findAll('a')):
        if key in link.get('href'):
            tb = pd.read_parquet(link.get('href'))
            yield tb


'''
Using tb.fillna(nan, inplace=True) resulted in the following:

FutureWarning: Downcasting object dtype arrays on .fillna, .ffill, .bfill is deprecated and will change in a future version. Call result.infer_objects(copy=False) instead. To opt-in to the future behavior, set `pd.set_option('future.no_silent_downcasting', True)`
  tb.fillna(nan, inplace=True)
'''

generators_pipeline = dlt.pipeline(
    destination='duckdb',
    dataset_name='generators'
)

conn = duckdb.connect(f"{generators_pipeline.pipeline_name}.duckdb")

info = generators_pipeline.run(
    stream_download_parquet(url=URL, key=KEY),
    table_name="stream_parquet_download",
    write_disposition="replace"
)

print(info)

start = time.time()

stream_parquet_download = conn.sql(f"SELECT * FROM {generators_pipeline.dataset_name}.stream_parquet_download")
print(stream_parquet_download)

end = time.time()
print(end - start)

conn.close()
```

[This](https://stackoverflow.com/questions/11023530/python-to-list-http-files-and-directories) helped.
