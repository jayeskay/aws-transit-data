import os
import pandas as pd
import pyarrow as pa
from pathlib import Path
from pyarrow.parquet import ParquetFile
from sqlalchemy import create_engine, text

USERNAME = os.getenv('POSTGRES_USER')
PASSWORD = os.getenv('POSTGRES_PASSWORD')
DATABASE = os.getenv('POSTGRES_DATABASE_DEV')
SCHEMA   = 'raw'
URL      = f'postgresql://{USERNAME}:{PASSWORD}@pgdatabase:5432/{DATABASE}'

def ingest():
    print('Let\'s get started!')
    print(os.environ)

    # create postgres engine
    print(f'{URL=}')
    engine = create_engine(URL)

    # create Path object for the current working directory
    cwd = Path.cwd()
    print(f'{cwd.resolve()=}')

    with engine.connect() as conn:
        conn.execute(text(f'create schema if not exists {SCHEMA};'))
        conn.commit()

    for item in os.listdir('data/'):
        # create new path by joining components
        file_path = cwd / 'data' / item

        if file_path.suffix == '.csv':
            print(f"READING CSV: {file_path}")

            # read csv
            df = pd.read_csv(file_path, nrows=100)
            print(df.info())

            # push to table
            table_name = item.split('.')[0].replace('-','')
            print(f'{table_name=}')
            df.to_sql(
                table_name,
                engine,
                schema=SCHEMA,
                if_exists='replace',
                index=False
            )

        elif file_path.suffix == '.parquet':
            print(f"READING PARQUET: {file_path}")

            # read parquet
            pf = ParquetFile(file_path)
            pf = next(pf.iter_batches(batch_size=100))
            df = pa.Table.from_batches([pf]).to_pandas()
            print(df.info())

            # push to table
            table_name = item.split('.')[0].replace('-','')
            print(f'{table_name=}')
            df.to_sql(
                table_name,
                engine,
                schema=SCHEMA,
                if_exists='replace',
                index=False
            )


if __name__ == '__main__':
    ingest()
