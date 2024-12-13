# Track Time Analysis

## Overview
This project pulls 100 Discogs master releases from each year from 1954 (when modern vinyl was first made commercially available) to 2024 to investigate trends in the average track lengths of song of different genres.

## Methodology
This notebook queries the [Discogs API](https://www.discogs.com/developers/) through Joalla's [Discogs API Client for Python](https://python3-discogs-client.readthedocs.io/en/latest/index.html). It requests 100 albums of each of Discogs's top 8 genres for each year from 2024 to 2025 and adds them to a pandas dataframe, then averages them out and appends information about the genre, year, and sample size of the averaged data. Last, it uses matplotlib to create a histogram of the collected data and exports it to SVG for further editing in Illustrator, Inkscape, or another vector editing program. See the track_time_analysis.ipynb Jupyter Notebook for the full code.

Once the raw averages data was exported to csv, I added a column referring to the era of musical technology associated with the year of the release:
- Vinyl (1954 - 1975)
- 8-track (1976 - 1983)
- Cassette (1984 – 1991)
- CD (1992 – 2003)
- MP3 (2004 - 2013)
- Streaming (2014 - 2024)

I then performed an ANOVA analysis on this data in R. See the discogs.R file in this directory for that code.
