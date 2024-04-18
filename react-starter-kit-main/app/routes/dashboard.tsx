/* SPDX-FileCopyrightText: 2014-present Kriasoft */
/* SPDX-License-Identifier: MIT */

import { useState } from 'react'
import { Box, Card, CardContent, Container, Typography, Slider } from "@mui/joy";
import { usePageEffect } from "../core/page";
import featureAnimationScatter from '../visuals/feature_animation_scatter/end.png';
import featureAnimationScatterGIF from '../visuals/feature_animation_scatter/final_visual_end_pause.gif';
import wordCloudGIF from '../visuals/word_cloud/final_visual_end_pause.gif';
import sentimentLineGIF from '../visuals/sentiment_line_chart/final_visual.gif';
import wordComplexityByYear from '../visuals/word_complexity_by_year/word_complexity_by_year.png';
import danceability from '../visuals/dance_speech/danceability.png';
import speechiness from '../visuals/dance_speech/speechiness.png';
import MySlider from '../components/MySlider'; // Importing MySlider component from MySlider.tsx

export const Component = function Dashboard(): JSX.Element {
  usePageEffect({ title: "Dashboard" });

  const [year, setYear] = useState<number>(1960);

  const handleChange = (event: Event, newValue: number | number[]) => {
    setYear(newValue as number);
  };

  const frameNumber = year - 1960;
  const gifSrc = `${featureAnimationScatterGIF}?frame=${frameNumber}`;

  return (
    <Container sx={{ py: 2 }}>
      <Typography sx={{ mb: 2 }} level="h2">
        SP24: Billboard Sentiments
      </Typography>
      <Box
        sx={{
          display: "grid",
          gridTemplateColumns: { sm: "1fr", md: "1fr 1fr" },
          gap: 2,
        }}
      >
        <Card sx={{ gridArea: "1 / 1 / 2 / -1" }}>
          <CardContent sx={{ minHeight: 300 }}>
            <Typography level="h3">Feature Animation Scatter Plot</Typography>
            <Typography>
              Here is a combined look at the energy and danceability of Top 100
              Songs. While the graph has a lot of moving parts, the takeaway is
              clear: songs have become both more danceable and energetic over
              time, as the dots have moved to the top left in tandem with the
              warm-colored line that shows the average value of their movements.
            </Typography>
            <br />
            <div style={{ display: 'flex', justifyContent: 'center' }}>
              <img src={featureAnimationScatter} alt="feature_animation_scatter" style={{ maxWidth: '45%', maxHeight: '100%', marginRight: '20px' }} />
              <img src={gifSrc} alt="feature_animation_scatter_GIF" style={{ maxWidth: '45%', maxHeight: '100%', marginLeft: '20px' }} />
            </div>
            <div style={{ margin: '0 50px' }}>
              <Slider
                value={year}
                onChange={handleChange}
                aria-labelledby="continuous-slider"
                min={1960}
                max={2019}
              />
            </div>
            <p>Current year: {year}</p>
          </CardContent>
        </Card>

        <Card>
          <CardContent sx={{ minHeight: 150 }}>
            <Typography level="h3">Word Complexity by Year</Typography>
            <Typography>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
              Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
              reprehenderit in voluptate velit esse cillum dolore eu fugiat
              nulla pariatur. Excepteur sint occaecat cupidatat non proident,
              sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Typography>
            <br />
            <div style={{ display: 'flex', justifyContent: 'center' }}>
              <img src={wordComplexityByYear} alt="wordComplexityByYear" style={{ maxWidth: '100%', maxHeight: '90%', marginLeft: '20px', marginRight: '20px' }} />
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent sx={{ minHeight: 150 }}>
            <Typography level="h3">Sentiment Over the Years</Typography>
            <Typography>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
              Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
              reprehenderit in voluptate velit esse cillum dolore eu fugiat
              nulla pariatur. Excepteur sint occaecat cupidatat non proident,
              sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Typography>
            <br />
            <div style={{ display: 'flex', justifyContent: 'center' }}>
              <img src={sentimentLineGIF} alt="sentimentLineGIF" style={{ maxWidth: '100%', maxHeight: '90%', marginLeft: '20px', marginRight: '20px' }} />
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent sx={{ minHeight: 150 }}>
            <Typography level="h3">Word Cloud</Typography>
            <Typography>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
              Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
              reprehenderit in voluptate velit esse cillum dolore eu fugiat
              nulla pariatur. Excepteur sint occaecat cupidatat non proident,
              sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Typography>
            <br />
            <div style={{ display: 'flex', justifyContent: 'center' }}>
              <img src={wordCloudGIF} alt="wordCloudGIF" style={{ maxWidth: '100%', maxHeight: '90%', marginLeft: '20px', marginRight: '20px' }} />
            </div>
          </CardContent>
        </Card>

        <Card sx={{ gridArea: "2 / 1 / 2 / -1" }}>
          <CardContent sx={{ minHeight: 300 }}>
            <Typography level="h3">Danceability and Speechiness</Typography>
            <Typography>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
              Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
              reprehenderit in voluptate velit esse cillum dolore eu fugiat
              nulla pariatur. Excepteur sint occaecat cupidatat non proident,
              sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Typography>
            <br />
            <div style={{ display: 'flex', justifyContent: 'center' }}>
              <img src={danceability} alt="danceability" style={{ maxWidth: '45%', maxHeight: '100%', marginRight: '20px' }} />
              <img src={speechiness} alt="speechiness" style={{ maxWidth: '45%', maxHeight: '100%', marginLeft: '20px' }} />
            </div>
          </CardContent>
        </Card>

        <Card>
          <CardContent sx={{ minHeight: 150 }}>
            <Typography level="h3">Breakdown by Decade</Typography>
            <Typography>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
              Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
              reprehenderit in voluptate velit esse cillum dolore eu fugiat
              nulla pariatur. Excepteur sint occaecat cupidatat non proident,
              sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Typography>
            <br />
          </CardContent>
        </Card>

        <Card>
          <CardContent sx={{ minHeight: 150 }}>
            <Typography level="h3">Danceability Through The Years</Typography>
            <Typography>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
              Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
              Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris
              nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
              reprehenderit in voluptate velit esse cillum dolore eu fugiat
              nulla pariatur. Excepteur sint occaecat cupidatat non proident,
              sunt in culpa qui officia deserunt mollit anim id est laborum.
            </Typography>
            <br />
          </CardContent>
        </Card>

      </Box>
    </Container>
  );
};
