#!/bin/bash

killall conky

conky -c ~/.config/conky/$1
