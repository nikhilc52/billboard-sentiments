/* SPDX-FileCopyrightText: 2014-present Kriasoft */
/* SPDX-License-Identifier: MIT */

import { Container, Typography } from "@mui/joy";
import { usePageEffect } from "../core/page";
import featureAnimationScatter from '../visuals/feature_animation_scatter/end.png';
import featureAnimationScatterGIF from '../visuals/feature_animation_scatter/final_visual_end_pause.gif';
import wordCloudGIF from '../visuals/word_cloud/final_visual_end_pause.gif';
import sentimentLineGIF from '../visuals/sentiment_line_chart/final_visual.gif';
import wordComplexityByYear from '../visuals/word_complexity_by_year/word_complexity_by_year.png';
import danceability from '../visuals/dance_speech/danceability.png';
import speechiness from '../visuals/dance_speech/speechiness.png';

export const Component = function Analysis(): JSX.Element {
  usePageEffect({ title: "Exploratory Analysis" });

  return (
    <Container sx={{ py: 2 }}>
      <Typography level="h2" gutterBottom>
        Exploratory Analysis
      </Typography>
      <Typography>TOOD: influence of rap on the top 100 songs...</Typography>
      <br />
      <div style={{ display: 'flex', justifyContent: 'center' }}>
        <img src={sentimentLineGIF} alt="sentimentLineGIF"
          style={{
            maxWidth: '70%', maxHeight: '70%',
            marginLeft: '20px', marginRight: '20px'
          }} />
      </div>
      <Typography variant="body1" color='black'>
        The above graph depicts a 5-year rolling average of the percentage of
        positive and negative songs within the end-of-year Billboard Top 100.
        It should be noted that certain songs were excluded from the data since
        they could not be matched to lyrics and thus could not be scored, which
        explains why some years might not have a percentage of positive and
        negative songs that add up to 100.
        <br /><br />
        While there are certainly fluctuations in sentiment over time, there is
        a general trend of negativity being more commonly found in top songs,
        with a visible shift being apparent at the turn of the century. This
        trend of negativity has continued into the songs themselves, that is,
        just as the makeup of Billboard songs have become more negative, the
        songs that are classified as negative (with a negative sentiment score)
        have been more extreme. For instance, in 1960, the average negative song
        had a score of -0.77, a much less negative sentiment than the 2015
        -0.92.
        <br /><br />
        There are a number of reasons for such a drastic increase in negativity,
        one of which being the introduction of rap into mainstream culture.
        Since 2000, there has been an average of more than 12 songs classified
        as “rap” by Spotify, a stark increase from the mere three Top-100
        placements the genre averaged before the 21st century. The correlation
        between the two trends is certainly interesting, but that is not to say
        that rap is inherently negative. Instead, looking at certain examples
        can help to paint a more clear picture of how rap has influenced total
        Billboard sentiment.
        <br /><br />
        In the 335 rap songs featured in our dataset, two songs stick out for
        their sentiment scores in relation to their personally-derived
        messaging. These songs are “Lifestyle” by Rich Gang and “Forever” by
        Drake. Charting in 2014 and 2009, with sentiment scores of -0.9114 and
        -0.9992, respectively. From reading the scores, we would expect the
        songs to be undoubtedly negative, but having listened to them, they are
        certainly not as cynical as one would expect.
        <br /><br />
        “Lifestyle” features multiple artists rapping about how they overcame
        certain struggles in their past lives, ultimately earning themselves a
        luxurious lifestyle:
      </Typography>
      <Typography variant="body1" style={{ fontStyle: 'italic', textAlign: 'center', color: 'black' }}>
        “I done (Hey), did a lot of shit just to live this here lifestyle
        (Oh, yeah, woo) <br />
        We came straight from the bottom to the top, my lifestyle
        (Lifestyle, ayy)”
      </Typography>
      <br />
      <Typography variant="body1" color='black'>
        “Forever” is a similar record, featuring artists like Lil Wayne, Kanye
        West, and Eminem orating their desire for eternal success as their had
        previously had nothing:
      </Typography>
      <Typography variant="body1" style={{ fontStyle: 'italic', textAlign: 'center', color: 'black' }}>
        “But understand, nothin' was done for me <br />
        So I don't plan on stoppin' at all <br />
        I want this shit forever, mane”
      </Typography>
      <Typography variant="body1" color='black'>
        <br />
        Despite the seemingly obvious positive messages these songs depict,
        their scores indicate the exact opposite. One reason for this inaccuracy
        might be due to NLTK’s treatment of expletives. For experiment’s sake
        (as purposefully removing data is unethical), removing expletives from
        each of the songs, and feeding them back into NLTK’s library yields
        much more understandable scores of 0.9973 for “Lifestyle” and 0.9737
        for “Forever”, indicating that there is a strong negative weightage
        that NLTK places on these types of words.
        <br /><br />
        Whether or not this is a fair judgment is a personal question that
        depends on one’s own emotions towards strong language and whether or
        not they believe profanity can taint a positive message. For NLTK, it
        believes that profanity is always negative, and this understanding can
        help to clear up the scores for rap songs and the corresponding increase
        in negativity: rap is not inherently negative, but the positive messages
        it communicates are often accompanied by expletives, typically at a
        higher rate than other genres. This means that NLTK views rap as more
        negative than other types of music (not for its message, but for its
        delivery), and thus when rap is featured in the Billboard charts more
        frequently, the overall Billboard sentiment decreases - once again, not
        inherently because of its genre, but because of NLTK’s “personal”
        opinion on word choice.
      </Typography>
    </Container >
  );
};
