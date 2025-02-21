import sys

def convert_to_utf8(input_file):
    with open(input_file, 'r', encoding='utf-16le') as f:
        content = f.read()
    with open(input_file, 'w', encoding='utf-8') as f:
        f.write(content)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python convert_to_utf8.py <file>")
        sys.exit(1)
    convert_to_utf8(sys.argv[1])