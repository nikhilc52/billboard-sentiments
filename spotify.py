import pandas as pd


data = pd.read_csv("scores.csv") 
df = pd.DataFrame(data)


ls = []
for x in data['track']:
    ls.append(x[1:len(x)-1].lower())
df["track"] = ls

ls = []
for x in data['artist']:
    ls.append(x.lower())
df["artist"] = ls

df = df.drop("Lyrics", axis = 1)

data2 = pd.read_csv("genre_music.csv")
df2 = pd.DataFrame(data2)

ls = []
for x in data2['track']:
    ls.append(x.lower())
df2["track"] = ls

ls = []
for x in data2['artist']:
    ls.append(x.lower())
df2["artist"] = ls

print(df.head)
print(df2.head)

final_df = pd.merge(df, df2, on=["track",'artist'])

print(final_df)