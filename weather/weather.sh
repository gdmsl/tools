#!/bin/bash

echo "Open a luakit instance to view the weather on forecast.io"
echo "and the name is set so that i3 can put the window in the"
echo "scratchpad"

luakit --name=scratchpadweather $TOOLSPATH/weather/weather.html
