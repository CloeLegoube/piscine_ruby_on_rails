# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    erehW.rb                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 15:29:47 by clegoube          #+#    #+#              #
#    Updated: 2016/12/06 15:29:51 by clegoube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env ruby -w

def		find_capital(code)
	states = {
		"Oregon" => "OR",
		"Alabama" => "AL",
		"New Jersey" => "NJ",
		"Colorado" => "CO"
		}
	states.each { |k, v|
		if (code == v)
			puts k
		end
	}
end

def		where_states()

	capitals_cities = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
		}
	if (ARGV.length != 1)
		return
	end
	capitals_cities.each { |k, v|
		if (v == ARGV[0])
			code = k
			find_capital code
			return
		end

	}
	puts "Unkown capital city"

end

where_states
