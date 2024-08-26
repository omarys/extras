def better_than_average(class_points, your_points):
    return your_points > sum(class_points) / len(class_points)


# from statistics import mean
#
# def better_than_average(class_points, your_points):
#     return your_points > mean(class_points)
