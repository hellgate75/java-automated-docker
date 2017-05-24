#!/bin/sh
gradle --build-file build.shell.gradle --settings-file settings.properties test testReport --recompile-scripts --refresh-dependencies --rerun-tasks
