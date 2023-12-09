import os

def print_directory_contents(path, max_depth, current_depth=0):
    if current_depth > max_depth:
        return

    for child in os.listdir(path):
        child_path = os.path.join(path, child)
        if os.path.isdir(child_path):
            print("  " * current_depth + "- {}".format(child))
            print_directory_contents(child_path, max_depth, current_depth + 1)
        else:
            print("  " * current_depth + "    - {}".format(child))

# Replace 'your/root/directory' with the path of the root directory you want to start from
root_directory = '/Users/jergashe/Documents/projects/all_transcendence/django_app/'

# Replace 2 with the desired maximum depth
max_depth = 3

print_directory_contents(root_directory, max_depth)
