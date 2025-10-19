#!/bin/bash

cat `grep -ril $1 */*md` | grep "url: "

