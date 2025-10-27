import os
import pandas as pd
from pathlib import Path
from sqlalchemy import create_engine

USERNAME = os.getenv('POSTGRES_USER')
PASSWORD = os.getenv('POSTGRES_PASSWORD')
DATABASE = os.getenv('POSTGRES_DB')
URL      = f'postgresql://{USERNAME}:{PASSWORD}@pgdatabase:5432/{DATABASE}'

def ingest():
    print('Let\'s get started!')

    # create postgres engine
    print(f'{URL=}')
    engine = create_engine(URL)

    # create Path object for the current working directory
    cwd = Path.cwd()
    print(f'{cwd.resolve()=}')

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
            df.to_sql(table_name, engine, if_exists='replace', index=False) 


if __name__ == '__main__':
    ingest()
