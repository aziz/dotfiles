#!/bin/bash

tclock() {
    TZ="$1" date
}


wclock() {
    echo -n "California: ";
    tclock America/Los_Angeles;
    echo -n "New York:   ";
    tclock America/New_York;
    echo -n "UK:         ";
    tclock Europe/London;
    echo -n "Sweden:     ";
    tclock Europe/Stockholm;
    echo -n "Calcutta:   ";
    tclock Asia/Calcutta;
    echo -n "Tokyo:      ";
    tclock Asia/Tokyo;
    echo -n "Auckland:   ";
    tclock Pacific/Auckland
}