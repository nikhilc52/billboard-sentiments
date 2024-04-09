import textstat
import csv
import matplotlib.pyplot as plt
import re
from collections import Counter
from textstat import textstat
import csv

year = 0
lyrics = 4
genre_to_info = {}
file_path = 'finalMatched.csv'

def process_lyrics(lyrics):
    processed_lyrics = lyrics.replace('\n', '. ').strip()
    if not processed_lyrics.endswith('.'):
        processed_lyrics += '.'
    return processed_lyrics

def analyze_lyrics(lyrics):
    words = re.findall(r'\b\w+\b', lyrics.lower())
    unique_words = set(words)
    diversity = len(unique_words) / len(words) if words else 0
    average_word_length = sum(len(word) for word in words) / len(words) if words else 0
    reading_ease_score = textstat.flesch_reading_ease(lyrics)
    return diversity, average_word_length, reading_ease_score

def calculate_complexity_score(diversity, average_word_length, reading_ease_score, weights=(1, 1, 1)):
    normalized_reading_ease = reading_ease_score / 100
    composite_score = (diversity * weights[0]) + (average_word_length * weights[1]) - (normalized_reading_ease * weights[2])
    return composite_score

with open(file_path, mode='r', encoding='utf-8') as file:
    csv_reader = csv.reader(file)
    
    next(csv_reader, None)
    
    for row in csv_reader:
        curr_genre = row[23]
        curr_lyrics = row[4]
        processed_lyrics = process_lyrics(curr_lyrics)
        diversity, average_word_length, reading_ease_score = analyze_lyrics(processed_lyrics)
        composite_score = calculate_complexity_score(diversity, average_word_length, reading_ease_score)

        if curr_genre not in genre_to_info:
            genre_to_info[curr_genre] = [0, 0]

        genre_to_info[curr_genre][0] += 1
        genre_to_info[curr_genre][1] += composite_score

genre_to_avg = {}

for genre, info in genre_to_info.items():
    num_songs = info[0]
    total_flesch = info[1]
    avg_flesch = total_flesch / num_songs
    genre_to_avg[genre] = avg_flesch

categories = genre_to_avg.keys()
print("categories:", categories)
values = [genre_to_avg[genre] for genre in categories]

# Creating the bar graph
plt.figure(figsize=(10, 6))  # Optional: Specifies the figure size
plt.bar(categories, values, color='skyblue')  # Creates the bar graph with skyblue bars

# Adding labels and title
plt.xlabel('Categories')  # X-axis label
plt.ylabel('Values')  # Y-axis label
plt.title('Bar Graph Example')  # Graph title

# Optional: Adding value labels on top of each bar
for i, value in enumerate(values):
    plt.text(i, value + 1, str(value), ha='center')

# Showing the plot
plt.show()