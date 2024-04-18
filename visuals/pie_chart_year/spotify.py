import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.animation import FuncAnimation

data = pd.read_csv("finalMatched.csv") 
df = pd.DataFrame(data)

all_frames = []
years = []
genre_colors = {
    'latin': '#cc489c',
    'pop': '#a85ba5',
    'edm': '#936eb1',
    'rap': '#7392cc',
    'r&b': '#52b5e7',
    'rock': '#1459e3',
    'other': '#bbe0f2',
    'nan' : '#a5b2b8',
}

def calculate_all_frames():
    global all_frames
    global years
    prev = None
    starting_year = 2019
    max_steps = 20 
    
    for frame in range(len(df) // 100):
        genre_counts = {'latin': 0, 'pop': 0, 'edm': 0, 'rap': 0, 'r&b': 0, 'other': 0}
        for _, row in df.iloc[frame*100:(frame+1)*100].iterrows():
            genre = row['genre']
            genre_counts[genre] = genre_counts.get(genre, 0) + 1

        if prev is None:
            prev = genre_counts
            all_frames.append(prev)
        else:
            for step in range(1, max_steps + 1):
                transition_frame = {}
                for genre, count in genre_counts.items():
                    prev_count = prev.get(genre, 0)
                    transition_frame[genre] = prev_count + (count - prev_count) * step / max_steps
                all_frames.append(transition_frame)
                years.append(starting_year)
            starting_year = starting_year - 1
            prev = genre_counts.copy()

def update_pie_chart(frame_index, year):
    plt.clf()
    frame_data = all_frames[frame_index]
    this_year = years[frame_index]
    labels = frame_data.keys()
    sizes = frame_data.values()
    colors = genre_colors.values()
    plt.pie(sizes, labels=labels, colors = colors, autopct='%1.1f%%', startangle=140)
    plt.axis('equal')
    plt.title(f'Genre Distribution ({this_year})')

calculate_all_frames()

starting_year = 2019
animation = FuncAnimation(plt.gcf(), update_pie_chart, fargs=(starting_year,), frames=len(all_frames), interval=50, repeat=False)

plt.show()

animation.save('genre_distribution_animation.mp4', writer='ffmpeg', fps=15)

