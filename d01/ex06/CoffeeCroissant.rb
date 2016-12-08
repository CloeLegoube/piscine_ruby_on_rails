# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    CoffeeCroissant.rb                                 :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 18:21:08 by clegoube          #+#    #+#              #
#    Updated: 2016/12/06 18:21:10 by clegoube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env ruby -w

def	croissant()
	people = Hash.new()
	data = [
	['Frank', 33],
	['Stacy', 15],
	['Juan' , 24],
	['Dom' , 32],
	['Steve', 24],
	['Jill' , 24]
	]
	data.each do |personne|
		people[personne[0]] = personne[1]
	end
	people = people.sort_by {|_key, value| _key}.sort_by {|_key, value| value}.to_h
	people.each do |firstname|
		puts firstname[0]
	end
end

croissant
