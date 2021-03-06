#!/usr/bin/env sh

station=8999 # windsor
# 26892 # ville de quebec
# 5415 # pierre trudeau itnl a
# 51157 # itnl a 51157
mkdir -p "weather";
for year in `seq 1994 2019`;do
    for month in `seq 1 1`;do
	wget --content-disposition "https://climate.weather.gc.ca/climate_data/bulk_data_e.html?format=csv&stationID=${station}&Year=${year}&Month=${month}&Day=14&timeframe=2&submit=Download+Data" -O "weather/${station}-${year}.csv";
    done;
done
