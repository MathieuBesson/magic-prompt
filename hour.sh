#!/bin/bash

hour() {
  date | awk '{print $4}'
}