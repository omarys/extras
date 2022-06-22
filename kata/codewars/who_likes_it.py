def likes(names):
    who_likes_it = ""
    if len(names) > 0:
        if len(names) == 1:
            who_likes_it = "%s likes this" % names[0]
        elif len(names) == 2:
            who_likes_it = "%s and %s like this" % (names[0], names[1])
        elif len(names) == 3:
            who_likes_it = "%s, %s and %s like this" % (names[0], names[1], names[2])
        else:
            who_likes_it = "%s, %s and %i others like this" % (
                names[0],
                names[1],
                len(names) - 2,
            )
        return who_likes_it
    else:
        return "no one likes this"


def dict_likes(names):
    # make a dictionary d of all the possible answers. Keys are the respective number
    # of people who liked it.
    
    # {} indicate placeholders. They do not need any numbers but are simply replaced/formatted
    # in the order the arguments in names are given to format
    # {others} can be replaced by its name; below the argument "others = length - 2"
    # is passed to str.format()
    length = len(names)
    d = {
        0: "no one likes this",
        1: "{} likes this",
        2: "{} and {} like this",
        3: "{}, {} and {} like this",
        4: "{}, {} and {others} like this",
    }
    return d[min(4, length)].format(*names[:3], others=length - 2)
    # d[min(4, length)] insures that the appropriate string is called from the dictionary
    # and subsequently returned. Min is necessary as len(names) may be > 4
    
    # The * in *names ensures that the list names is blown up and that format is called
    # as if each item in names was passed to format individually, i. e.
    # format(names[0], names[1], .... , names[n], others = length - 2
