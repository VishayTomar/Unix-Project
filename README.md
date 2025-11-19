Simple Task Scheduler (Unix Project)

This is a basic Unix shell script that works as a simple task scheduler.
It can run any command after a delay or at a specific time (HH:MM).

Features

Run a command after a delay (in seconds)

Run a command at a specified time (24-hour format)

Very simple and beginner-friendly

Works on any Unix-like environment (Linux, macOS, Git Bash)

How to Use
1. Run after a delay
./sheduler.sh -d <delay_in_seconds> <command>

Example:

./sheduler.sh -d 10 echo "Hello World"


(Runs after 10 seconds)

2. Run at a specific time
./sheduler.sh -t <HH:MM> <command>


Example:

./sheduler.sh -t 18:30 echo "Task executed"

Files Included

sheduler.sh — main shell script

README.md — documentation

 How It Works (Short Explanation)

-d flag → waits for given seconds → runs the command

-t flag → calculates seconds until specified time → waits → runs the command

Uses built-in Unix commands like date, sleep, and eval

Shows an error if wrong options are provided

Author:
Vishay Tomar
