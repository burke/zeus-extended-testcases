#!/bin/sh

echo "\x1b[35m***** rspec\x1b[0m"
zeus rspec spec/simple_spec.rb

echo "\x1b[35m***** generate\x1b[0m"
zeus generate migration omg

echo "\x1b[35m***** server\x1b[0m"
zeus server

echo "\x1b[35m***** console\x1b[0m"
zeus console

echo "\x1b[35m***** rake\x1b[0m"
zeus rake middleware

