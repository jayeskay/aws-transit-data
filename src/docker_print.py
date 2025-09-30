from os import getenv


def main():
    username = getenv('SOMENAME')
    print(f'Hello, {username}!')


if __name__ == '__main__':
    main()
