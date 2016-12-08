# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    whereto.rb                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 15:39:39 by clegoube          #+#    #+#              #
#    Updated: 2016/12/06 15:39:41 by clegoube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env ruby -w

def	whereto()
	states = {
		"Oregon" => "OR",
		"Alabama" => "AL",
		"New Jersey" => "NJ",
		"Colorado" => "CO"
	}
	capitals_cities = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
	}
	if ARGV.size > 1
		return
	elsif ARGV.size == 1
		list = ARGV[0].split(',').map{ |x| x.strip.split(' ').map(&:capitalize).join(' ')}
		list.each do |arg|
			if capitals_cities.has_value? arg
				puts "#{arg} is the capital of #{states.key(capitals_cities.key(arg))} (akr: #{capitals_cities.key(arg)})"
			elsif states.has_key? arg
				puts "#{capitals_cities[states[arg]]} is the capital of #{arg} (akr: #{states[arg]})"
			elsif arg != ''
				puts "#{arg} is neither a capital city nor a state"
			end
		end
	end
end

whereto
