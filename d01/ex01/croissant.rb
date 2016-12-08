# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    croissant.rb                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 12:26:53 by clegoube          #+#    #+#              #
#    Updated: 2016/12/06 12:26:55 by clegoube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env ruby -w

def		numbers()
	file = File.open("numbers.txt", "r").read.split(/,?\n/).sort_by(&:to_i)
	puts file
end

numbers
