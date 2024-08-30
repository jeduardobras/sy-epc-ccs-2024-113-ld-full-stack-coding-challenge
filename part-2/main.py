import sys

# Use the run function as entry point for your solution
# Do not modify its signature, as it will be used by our tests.
def run(file_path):
    # TODO: Parse the file
    # TODO: Solve the puzzle
    # TODO: Print the solution
    pass

# Do not modify the __main__ block.
if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: python main.py <file_path>")
    else:
        file_path = sys.argv[1]
        print(f"Starting program with sys.argv[1]: {file_path}")
        run(file_path)