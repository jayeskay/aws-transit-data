from os import getenv

def ingest():
    print('Hello, World!')

    username = getenv('SOMENAME')

    print(username)


if __name__ == '__main__':
    ingest()
