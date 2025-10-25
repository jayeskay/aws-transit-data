import os
import pandas as pd
from pathlib import Path

USERNAME = os.getenv('POSTGRES_USER')
PASSWORD = os.getenv('POSTGRES_PASSWORD')
DATABASE = os.getenv('POSTGRES_DB')


def ingest():
    print('Let\'s get started!')

    print(f'postgresql://{USERNAME}:{PASSWORD}@pgdatabase:5432/{DATABASE}')

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


if __name__ == '__main__':
    ingest()
