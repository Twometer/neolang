#!/bin/bash
cd gen/
flex ../neo.l
bison -dtv ../neo.y

gcc neo.tab.c ../main.c -lfl -o neoparser