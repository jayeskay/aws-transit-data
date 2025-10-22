from os import getenv


def main():
    username = getenv('POSTGRES_USER')
    print(f'Hello, {username}!')


if __name__ == '__main__':
    main()
