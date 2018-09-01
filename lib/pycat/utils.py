def copy_stream(i, o, chuck_size=1024):
    while True:
        data = i.read(chuck_size)
        if len(data) == 0:
            break
        o.write(data)
