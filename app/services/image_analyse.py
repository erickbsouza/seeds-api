import sys
import random
import json

def analyze_image(image_path):
    high_vigor = random.randint(0, 40)
    fungus = random.randint(0, 10)
    physical_damage = random.randint(0, 15)
    wrinkled = random.randint(0, 20)
    chemical_damage = random.randint(0, 5)
    seeds_total = high_vigor + fungus + physical_damage + wrinkled + chemical_damage

    # Create a dictionary to hold the results
    result = {
        'high_vigor': high_vigor,
        'fungus': fungus,
        'physical_damage': physical_damage,
        'wrinkled': wrinkled,
        'chemical_damage': chemical_damage,
        'seeds_total': seeds_total
    }

    return json.dumps(result)

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python image_analyse.py <image_path>")
        sys.exit(1)
    image_path = sys.argv[1]
    print(analyze_image(image_path))