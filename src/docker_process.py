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


def load_contents(df, item, engine) -> None:
    # print data info to log
    print(df.info())

    # define table name
    table_name = item.split('.')[0].replace('-','')
    print(f'{table_name=}')

    with engine.connect() as conn:
        conn.execute(text(f'drop table if exists {SCHEMA}.{table_name} cascade;'))
        conn.commit()

    # push to table
    df.to_sql(
        name=table_name,
        con=engine,
        schema=SCHEMA,
        if_exists='replace',
        index=False
    )

    return None


def main() -> None:
    print("Let's get started!")
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
        file_type = file_path.suffix

        print(f"Reading {file_type}: {file_path}")

        if file_type == '.csv':
            # read csv
            df = pd.read_csv(file_path, nrows=100)

            load_contents(df, item, engine)

        elif file_type == '.parquet':
            # read parquet
            pf = ParquetFile(file_path)
            pf = next(pf.iter_batches(batch_size=100))
            df = pa.Table.from_batches([pf]).to_pandas()

            load_contents(df, item, engine)

        else:
            pass

    return None


if __name__ == '__main__':
    main()
