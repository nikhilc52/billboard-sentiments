import nltk
from nltk.corpus import stopwords
from nltk.tokenize import word_tokenize
import csv

nltk.download('stopwords')
nltk.download('punkt')


def edit_column(csv_file, column_index, edit_function):
    with open(csv_file, 'r', newline='') as file:
        reader = csv.reader(file)
        data = list(reader)
        
        for row in data:
            row[column_index] = edit_function(row[column_index])
    
    return data

def remove_stop_words(text):
    words = word_tokenize(text)
    stop_words = set(stopwords.words('english'))
    filtered_words = [word for word in words if word.lower() not in stop_words]
    filtered_sentence = ' '.join(filtered_words)
    return filtered_sentence


# Example usage
input_file = 'finalMatched.csv'
output_file = 'noStopWords.csv'
column_index_to_edit = 4  # Index of the column you want to edit (0-based)

# Edit the specified column using the edit function
edited_data = edit_column(input_file, column_index_to_edit, remove_stop_words)

# Write the edited data to a new CSV file
with open(output_file, 'w', newline='') as file:
    writer = csv.writer(file)
    writer.writerows(edited_data)

print(f"File '{output_file}' created with the edits.")