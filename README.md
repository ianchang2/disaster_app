# Interactive Dashboard of U.S. Billion-Dollar Weather and Climate Disasters (1980–2024)
# Portfolio Project 4
This is the repo for Portfolio Project 4. For the most up-to-date instructions, see [the course website](https://stat220-s25.github.io/portfolio/portfolio-4.html)


### link: [disaster data](https://ianchang2.shinyapps.io/disaster-data/)

### Files:

- `README.md` – This file, which explains the app and how to use the repo.
- `app.R` – Main Shiny app file that contains both UI and server logic.
- `plot_data.csv` – Cleaned dataset used in the visualization (if applicable).

---

## Interactivity Overview

This project enhances a previously static visualization of billion-dollar disasters in the U.S. by adding interactive features through the Shiny and Plotly libraries. 
Users can now select specific disaster types using checkboxes, allowing them to isolate trends for particular events such as hurricanes, droughts, or wildfires. 
Additionally, the ability to hover over the plot reveals exact event counts, making the data more accessible and precise. 
With the inclusion of a date range slider, users can filter the data by year, focusing on specific periods of interest.
These data are additionally all summed into a table, letting users see the total number of disasters and their associated costs for each range of years, providing a comprehensive overview of the trends over time.
These interactive elements significantly improve the user experience by transforming a cluttered, one-size-fits-all chart into a customizable and exploratory tool. 
Instead of being overwhelmed by tightly overlapping lines, users can focus on the aspects of the data that interest them most, uncovering patterns and insights that could likely be missed in a static display.

---

## How to Navigate the Repo

Everything needed is in the root directory:
- Run the app by clicking the link above or by opening `app.R` in RStudio and clicking **Run App**.


## Data

The data were retreived from the National Oceanic and Atmospheric Administration (NOAA) [billion dollar disasters](https://www.ncei.noaa.gov/access/billions/time-series) dataset, and include records of billion-dollar disasters in the U.S. from 1980 to 2024. The dataset contains information on various types of disasters, their costs, and the years they occurred.

