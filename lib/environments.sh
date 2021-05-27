#! /usr/bin/env bash

function activate_environments {
  activate_dev_environment
  activate_rpi_environment
}

function activate_dev_environment {
  true
}

function activate_rpi_environment {
  if [[ $USER == "pi" ]]; then
    supe
  fi
}
