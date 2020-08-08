import sys
import base64

def main(password, action):
    if action=='decrypt':
        print(base64.b64decode(password).decode("utf-8"))
    else:
        print(base64.b64encode(password.encode("utf-8")))

main("ncfuf_dev6", "no")