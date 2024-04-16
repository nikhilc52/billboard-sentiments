import textstat
import csv
import matplotlib.pyplot as plt
import re
from collections import Counter
from textstat import textstat
import csv

year = 0
lyrics = 4
year_to_info = {}
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
        curr_year = int(row[0])
        curr_lyrics = row[4]
        processed_lyrics = process_lyrics(curr_lyrics)
        diversity, average_word_length, reading_ease_score = analyze_lyrics(processed_lyrics)
        composite_score = calculate_complexity_score(diversity, average_word_length, reading_ease_score)

        if curr_year not in year_to_info:
            year_to_info[curr_year] = [0, 0]

        year_to_info[curr_year][0] += 1
        year_to_info[curr_year][1] += composite_score

year_to_avg = {}

for year, info in year_to_info.items():
    num_songs = info[0]
    total_flesch = info[1]
    avg_flesch = total_flesch / num_songs
    year_to_avg[year] = avg_flesch

sorted_years = sorted(year_to_avg.keys())
sorted_scores = [year_to_avg[year] for year in sorted_years]
sorted_sizes = [year_to_info[year][0] for year in sorted_years]

plt.figure(figsize=(10, 6))
plt.plot(sorted_years, sorted_scores, marker='o', linestyle='-', color='#cc489c')

plt.title('Trend of Average Word Complexity by Year')
plt.xlabel('Year')
plt.ylabel('Average World Complexity')

plt.xticks(range(min(sorted_years), max(sorted_years) + 1, 10), rotation='horizontal')
byline = "By: Stuti Gupta"
plt.figtext(0.95, 0.01, byline, fontsize=10, ha='right', va='bottom')

plt.grid(True)

plt.show()
