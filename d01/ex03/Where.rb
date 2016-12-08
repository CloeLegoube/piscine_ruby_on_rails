# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Where.rb                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 13:20:13 by clegoube          #+#    #+#              #
#    Updated: 2016/12/06 13:20:15 by clegoube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env ruby -w

def		find_capital(code)
	capitals_cities = {
		"OR" => "Salem",
		"AL" => "Montgomery",
		"NJ" => "Trenton",
		"CO" => "Denver"
		}
	capitals_cities.each { |k, v|
		if (code == k)
			puts v
		end
	}
end

def		where_states()
	states = {
		"Oregon" => "OR",
		"Alabama" => "AL",
		"New Jersey" => "NJ",
		"Colorado" => "CO"
		}
	if (ARGV.length != 1)
		return
	end
	states.each { |k, v|
		if (k == ARGV[0])
			code = v
			find_capital code
			return
		end

	}
	puts "Unkown state"

end

where_states
