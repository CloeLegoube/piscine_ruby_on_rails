# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    H2o.rb                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clegoube <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/12/06 12:48:07 by clegoube          #+#    #+#              #
#    Updated: 2016/12/06 12:48:09 by clegoube         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env ruby -w

def 	hash_table()
	data = [['Caleb' , 24],
			['Calixte' , 84],
			['Calliste', 65],
			['Calvin' , 12],
			['Cameron' , 54],
			['Camil' , 32],
			['Camille' , 5],
			['Can' , 52],
			['Caner' , 56],
			['Cantin' , 4],
			['Carl' , 1],
			['Carlito' , 23],
			['Carlo' , 19],
			['Carlos' , 26],
			['Carter' , 54],
			['Casey' , 2]
			]
	new_hash = Hash.new()
	data.each do |cell|
		new_hash[cell[0]] = cell[1]
	end
	new_hash.each { |k, v| puts "#{k} : #{v}" }
end

hash_table
