rubydos
=======

Ruby DoS Tool

Simple multithreaded Ruby script to test a remote server for vulnerability to DoS by sending null packets.

It works by creating half-open TCP connections and sending null packets, but never closing the connections.

See here for information on half open TCP connections http://en.wikipedia.org/wiki/TCP_half-open

Usage: (preferably j)ruby slappy.rb [host] [port] <threads> <connections>

USE AT YOUR OWN RISK.
